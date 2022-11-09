class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index,:create]
  before_action :counter_rootpath, only: [:index, :create]
  before_action :soldout_rootpath, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       pay_item
       @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code,:shipping_area_id,:municipalities,:house_number,:house_name,:phone_number,:order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'                 
      )
    end

    def counter_rootpath
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    end

    def soldout_rootpath
      if @item.order!= nil
        redirect_to root_path
      end
    end

end
