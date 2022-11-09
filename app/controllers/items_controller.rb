class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc) 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end

  def edit
    if @item.order!= nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
   if @item.user_id == current_user.id
       @item.destroy
        redirect_to root_path
   end
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :text, :postage_id, :category_id, :shipping_area_id, :shipping_days_id,
                                 :condition_id).merge(user_id: current_user.id)
  end

  def set_furima
    @item = Item.find(params[:id])
  end

  def prevent_url
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
