class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new

  end

  def create
    cat = Cat.new(params[:cat])
    if cat.save
      @cat = cat
      render :show
    else
      redirect_to new_cat_url
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    if @cat = Cat.update(params[:id],params[:cat])
      render :show
    else
      redirect_to cats_url
    end
  end

  def destroy
  end

end
