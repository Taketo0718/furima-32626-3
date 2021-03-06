class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(created_at:"DESC")
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
    if @item.order != nil then
      redirect_to action: :index
    end
  end

  def edit
  end

  def update
    if @item.update(item_params) then
      redirect_to(@item)
    else
      render :edit
    end
  end
  def destroy
    if current_user.id == @item.user_id  then
    @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item)
    .permit(:image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
            :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id,
            :item_price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @item.user then
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
