class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    @reservations = Reservation.order("created_at desc").page(params[:page]).per(5)
  end

  def password
    @reservation = Reservation.find_by_id(params[:id])
  end

  def password_confirm
    @reservation = Reservation.find_by_id(params[:id])
    if @reservation.password == params[:password]
      redirect_to @reservation
    else 
      redirect_to :back
    end
  end

  def add_new_comment
    reservation = Reservation.find(params[:id])
    reservation.comments << Comment.new(comment_params)
    redirect_to :action => :show, :id => reservation
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.writer = current_user.username
    @reservation.email = current_user.email

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :writer)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:title, :content, :writer, :email, :password)
    end
end
