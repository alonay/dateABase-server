class CharsController < ApplicationController
  before_action :set_char, only: [:show, :update, :destroy]
  # GET /users
  def index
    @chars = Char.all
    render json: @chars
  end
  def show
    render json: @chars
  end
  # POST
  def create
    @char = Char.new(char_params)
    if @char.save
      render json: @char,status: :created, user: @char
    else
      render json: @char.errors, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /users/1
  def update
    @char = Char.find(params[:id])
    @char.update(char_params)
    if @char.save
      render json: @char
    else
      render json: @char.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @char.destroy
  end
  private
  # def set_char
  #   @char = Char.find(params[:id])
  # end
   def char_params
    params.require(:char).permit(:name)
  end
end
