class Admin::ProductsController < Admin::BaseController
  before_action :find_product, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:attachments]
        params[:attachments].each do |attachment|
          @product.attachments.create(attachment: attachment)
        end
      end
      redirect_to admin_products_path, notice: "新增商品完成"
    else
      flash.now[:error]=@product.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      if params[:attachments]
        params[:attachments].each do |attachment|
          @product.attachments.create(attachment: attachment)
        end
      end
      redirect_back(fallback_location: admin_products_path, notice: "商品更新成功")
    else
      redirect_back(fallback_location: admin_products_path, alert: @product.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: "商品已刪除"
  end

  def delete_attachment
    attachment = ProductAttachment.find(params["id"])

    if attachment
      attachment.delete
      redirect_back(fallback_location: admin_products_path, notice: "成功刪除照片")
    else
      redirect_back(fallback_location: admin_products_path, notice: "無法刪除，請洽工程師")
    end

  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to products_path, notice: "無此商品" unless @product
  end

  def product_params
    params.require(:product).permit(:name, :desc, :state, :original_price, :sell_price, :category_id, :sku,
                                    :attachments_attributes => [:id, :attachment, :_destroy])
  end

  

end
