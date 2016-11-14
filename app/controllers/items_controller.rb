class ItemsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @item = Item.find_by(id: params[:id])
    @closet_item = ClosetItem.find_or_create_by(closet_id: current_user.mycloset.id, item_id: params[:id])
  end

  def update
    byebug
  end

  def new
    @closet = Closet.find_by(user_id: current_user.id)
    @item = Item.new
    @item.closet_items.build
  end

  def create
    @item = Item.create(item_params)
    @item.save
    redirect_to @item
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :designer, :image, closet_items_attributes: [:qauntity, :note, :closet_id])
  end

end
