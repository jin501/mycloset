class ClosetItemsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @item = Item.find_by(id: params[:id])
    @closet_item = ClosetItem.find_or_create_by(closet_id: params[:closet_id], item_id: params[:id])
  end

  def update
    @closet_item = ClosetItem.find_or_create_by(closet_id: params[:closet_id], item_id: params[:id])
    @closet_item.update(item_params[:closet_items_attributes])

    redirect_to closet_item_path
  end

  def new
    @closet = Closet.find_by(user_id: current_user.id)
    @item = Item.new
    @item.closet_items.build
  end

  def create
    @item = Item.create(item_params)
    @item.save
    redirect_to closet_item_path
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :designer, :image, closet_items_attributes: [:closet_id, :item_id, :comment, :note, :qauntity, :note, :size, :last_worn, :status, :bought, :season])
  end

end
