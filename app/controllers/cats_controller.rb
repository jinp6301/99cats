class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @colors = %w(white red blue black brown green orange tortoiseshell)
  end

  def create
    params[:cat][:user_id] = User.find_by_session_token(session[:session_token]).id
    cat = Cat.new(params[:cat])
    p cat
    p "session user id is"
    p session[:user_id]
    if cat.save
      @cat = cat
      render :show
    else
      redirect_to new_cat_url
    end
  end

  def edit
    @colors = %w(white red blue black brown green orange tortoiseshell)
    @cat = Cat.find(params[:id])
  end

  def update
    user = User.find_by_session_token(session[:session_token])
    if Cat.find(params[:id]).user_id == user.id && @cat = Cat.update(params[:id],params[:cat])
      render :show
    else
      flash[:notices] ||= []
      flash[:notices] << "Stop being weird"
      redirect_to cats_url
    end
  end

  def destroy
    Cat.destroy(params[:id])
    @cats = Cat.all
    render :index
  end

end
