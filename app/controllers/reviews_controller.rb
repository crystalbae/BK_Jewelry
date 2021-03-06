class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @reviews = Review.order("created_at desc").page(params[:page]).per(5)
  end

  def add_new_comment
    review = Review.find(params[:id])
    review.comments << Comment.new(comment_params)
    redirect_to :action => :show, :id => review
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @product = Product.find_by_id(@review.product_id)
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @product = Product.find_by_id(params[:product_id])
  end

  # GET /reviews/1/edit
  def edit
    @product = Product.find_by_id(@review.product_id)
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.writer = current_user.username
    @review.email = current_user.email
    @review.product_id = params[:product_id]

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :writer)
    end

    def set_product
      @product = Product.find_by_id(@review.product_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content, :writer, :email, :product_id, :image)
    end
end
