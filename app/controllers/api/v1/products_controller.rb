class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = ProductsFetcher.new(products_params).fetch
  end

  def create
    @product = Product.create(products_params)

    if @product.save
      render :create, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def show; end

  def update
    @product.attributes = products_params

    @product.save!
    render :show
  rescue
    render json: @product.errors.messages
  end

  def destroy
    @product.destroy!
  rescue
    render json: @product.errors, status: :unprocessable_entity
  end

  private

  def products_params
    params.permit(:name)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
