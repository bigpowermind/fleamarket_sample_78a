class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy, :show, :purchase]
  before_action :set_categories, only: [:show]
  before_action :set_parents, only: [:new, :create, :show, :edit, :update]

  # 商品一覧表示
  def index
    # N+1問題を解消するためにincludesメソッドを使用（includesメソッドを使用するとすべてのレコードを取得するためallメソッドは省略可能）
    @items = Item.includes(:images).order("created_at DESC").limit(5)
  end

  # 商品出品ページへ遷移する処理
  def new
    # Itemモデルのインスタンスを生成(form_withで使用するためインスタンス変数が必要)
    @item = Item.new
    # @item.images.newにより、newアクションで定義されたItemクラスのインスタンスに関連づけられたImageクラスのインスタンスが作成される。
    @item.images.new
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "削除しました"
    else
      render :edit
    end
  end

  # 商品の保存
  def create
    @item = Item.new(item_params)
    # 商品の保存に成功した場合、保存に失敗した場合で処理を分岐
    if @item.save
      redirect_to root_path, notice: "商品が出品されました"
    else
      @item.images.new
      render :new, notice: "商品が出品されませんでした"
    end
  end

  # 商品編集(編集のためのビューの表示)
  def edit
  end

  # 商品編集のupdate(実際のデータ更新)
  def update
    if @item.update(item_update_params)
      redirect_to root_path, notice: "商品の編集が完了しました"
    else
      @item.images.new
      render :edit, notice: "商品の編集に失敗しました"
    end
  end

  # 商品削除
  def destroy
    if current_user.id == @item.seller_id && @item.destroy
      redirect_to root_path, notice: "商品が削除されました"
    else
      render :index, notice: "商品の削除に失敗しました"
    end
  end

  # 商品購入ページ
  def purchase
    @contact_information = ContactInformation.find_by(user_id: current_user.id)
    @contact_information_prefecture = Prefecture.find(@contact_information.prefecture_id)
  end

  # クレジットカード登録(payjp)
  def pay
    item = Item.find(params[:id])
    Payjp.api_key = 'sk_test_92e017bea9f22bf617d74e26'
    Payjp::Charge.create(
      amount: item.price.to_i,
      customer: Creditcard.find_by(user_id: current_user.id).customer_id,
      currency: 'jpy'
    )
    if item.update(buyer_id: current_user.id)
      redirect_to root_path, notice: "購入が完了しました"
    else
      render :pay, notice: "購入が完了していません"
    end
  end

  # カテゴリー
  def category
    # カテゴリーの非同期通信
    respond_to do |format|
      format.html { redirect_to :root}
      format.json  do
        if params[:parent_id]
          # 子カテゴリーを@childrenに代入
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  # クラス外から呼び出すことのできないメソッド
  private

  # ストロングパラメーターを使って、指定したキーを持つパラメーターのみを受け取るように制限
  def item_params
    # fields_forを利用して作成されたフォームから来る値は、○○s_attributes: [:××]という形でparamsに入る。○○は関連付く側のモデルの名前、××にはフォームに対応するカラムの名前が入る。
    params.require(:item).permit(:name, :explain, :status_id, :deliveryfee_id, :prefecture_id, :shippingdays_id, :price, :seller_id, :buyer_id, :auction_id, :category_id, brands_attributes: [:name], images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # image_attributesに_destroyキーを追加。fields_forから送られてくるこのキーを持った情報を頼りにrailsが子モデルの更新・削除を行う。
  def item_update_params
    params.require(:item).permit(:name, :explain, :status_id, :deliveryfee_id, :prefecture_id, :shippingdays_id, :price, :seller_id, :buyer_id, :auction_id, :category_id, brands_attributes: [:name], images_attributes: [:image, :id, :_destroy]).merge(seller_id: current_user.id)
  end

  def set_categories
    @categories = Category.all
  end

  def set_parents
    # Categoryテーブルのancestryがnil（親要素の値)
    @parents = Category.where(ancestry: nil)
  end

end
