class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  # before_action :set_product

  # GET /asks
  # GET /asks.json
  def index
    @asks = Ask.all
    @asks = Ask.order("created_at desc").page(params[:page]).per(5)
  end

  # GET /asks/1
  # GET /asks/1.json

  def password
    @ask = Ask.find_by_id(params[:id])
  end

  def password_confirm
    @ask = Ask.find_by_id(params[:id])
    if @ask.password == params[:password]
      redirect_to @ask
    else 
      redirect_to :back
    end
  end

  def add_new_comment
    ask = Ask.find(params[:id])
    ask.comments << Comment.new(comment_params)
    redirect_to :action => :show, :id => ask
  end

  def show
    @product = Product.find_by_id(@ask.product_id)
  end

  # GET /asks/new
  def new
    @ask = Ask.new
    @product = Product.find_by_id(params[:product_id])
  end

  # GET /asks/1/edit
  def edit
    @product = Product.find_by_id(@ask.product_id)
  end

  # POST /asks
  # POST /asks.json
  def create
    @ask = Ask.new(ask_params)
    @ask.writer = current_user.username
    @ask.email = current_user.email
    @ask.product_id = params[:product_id]

    respond_to do |format|
      if @ask.save
        format.html { redirect_to @ask, notice: 'Ask was successfully created.' }
        format.json { render :show, status: :created, location: @ask }
      else
        format.html { render :new }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asks/1
  # PATCH/PUT /asks/1.json
  def update
    respond_to do |format|
      if @ask.update(ask_params)
        format.html { redirect_to @ask, notice: 'Ask was successfully updated.' }
        format.json { render :show, status: :ok, location: @ask }
      else
        format.html { render :edit }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asks/1
  # DELETE /asks/1.json
  def destroy
    @ask.destroy
    respond_to do |format|
      format.html { redirect_to asks_url, notice: 'Ask was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ask
      @ask = Ask.find(params[:id])
    end

    def set_product
      @product = Product.find_by_id(@ask.product_id)
    end

    def comment_params
      params.require(:comment).permit(:content, :writer)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ask_params
      params.require(:ask).permit(:title, :content, :writer, :product_id, :email, :password)
    end
end
