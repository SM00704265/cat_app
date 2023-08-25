class ProductsController < ApplicationController
  before_action :set_product, only: %i[ update ]

  def create
    @product = Product.new(product_params)
    if @product.save
      Notifier.new.send_message("A new CAT product is created with name:#{@product.name}, description:#{@product.description}, price:#{@product.price}")
      render json: @product, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      Notifier.new.send_message("CAT product with id:#{@product.id} is updated with name:#{@product.name}, description:#{@product.description}, price:#{@product.price}")
      render json: @product, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.permit(:name,:description,:price)
    end
end
