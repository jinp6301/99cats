class CatRentalRequestsController < ApplicationController

  before_filter :authenticate_user

  def new
    @cats = Cat.all

  end

  def create
    request = CatRentalRequest.new(params[:cat_rental_request])
    if request.save
      request
      @request = request
      render :show
    else
      redirect_to new_cat_rental_request_url
    end
  end

  def show
    @request = CatRentalRequest.find(params[:id],params[:cat_id])
    p session[:session_token]
  end

  def update
    approve = CatRentalRequest.find(params[:cat_rental_request][:id]).update_attribute(:status, params[:cat_rental_request][:status])
    if approve
      @request = CatRentalRequest.find(params[:cat_rental_request][:id])
      render :show
    else
      redirect_to new_cat_rental_request_url
    end
  end

end
