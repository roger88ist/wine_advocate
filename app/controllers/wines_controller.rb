class WinesController < ApplicationController

  before_action :find_wine, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
      @wines = Wine.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @wines = Wine.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def new
    @wine = current_user.wines.build
    @categories =  Category.all.map{ |c| [c.name, c.id]}
  end

  def show
  end

  def create
    @wine = current_user.wines.build(wine_params)
    @wine.category_id = params[:category_id]

    if @wine.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories =  Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    @wine.category_id = params[:category_id]
    if @wine.update(wine_params)
      redirect_to wine_path(@wine)
    else
      render 'edit'
    end
  end

  def destroy
    @wine.destroy
    redirect_to root_path
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :description, :origin, :category_id, :wine_img)
  end

  def find_wine
    @wine = Wine.find(params[:id])
  end

end
