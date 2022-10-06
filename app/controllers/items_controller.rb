class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user).order(created_at: 'DESC')
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_info, :category_id, :condition_id, :cost_burden_id, :prefectures_id,
                                 :aim_id, :item_price).merge(user_id: current_user.id)
  end
end
