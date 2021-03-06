class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    if params[:category]
      category = Product.categories[params[:category]]
      @products = Product.where(category: category)   
    else
      @products = Product.all
    end
    # @categories = Category.all
  end
  # GET /products/1
  # GET /products/1.json
  def show
    product = Product.find(@product.id)
    product.like += 1
    product.save

    @asks = Ask.where(product_id: @product.id).order("asks.created_at").page(params[:page]).per(5)
    @reviews = Review.where(product_id: @product.id).order("reviews.created_at").page(params[:page]).per(5)
  end

  # GET /products/new
  def new
    @product = Product.new   
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_ask
      @ask = Ask.find_by_id(@product.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category, :name, :explanation, :image, :price, :like)
    end
end
