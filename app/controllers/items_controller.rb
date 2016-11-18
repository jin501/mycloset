class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @closet_item = ClosetItem.find_or_create_by(closet_id: params[:closet_id], item_id: params[:id])
  end

  def update
    @closet_item = ClosetItem.find_or_create_by(closet_id: params[:closet_id], item_id: params[:id])
    @closet_item.update(item_params[:closet_items_attributes])
    @closet = current_user.mycloset
    redirect_to closet_path(@closet)
  end

  def new
    @closet = Closet.find_by(user_id: current_user.id)
    @item = Item.new
    @item.closet_items.build
  end

  def create
    binding.pry
    @item = Item.find_or_create_by(name: item_params[:name], designer: item_params[:designer])
    @item.update(item_params)
    @closet = current_user.mycloset

    respond_to do |format|
      if @item.valid?
        format.html { redirect_to closet_item_path(@closet, @item), notice: 'Item was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @item }
      else
        # format.html { redirect_to new_closet_item_path(@closet) }
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end

  end


  #
  # if @item.valid?
  #   redirect_to closet_item_path(@closet, @item), alert: "success"
  # else
  # end

  def show
    @closet = current_user.mycloset
    @item = Item.find_by(id: params[:id])
    @closet_item = ClosetItem.find_or_create_by(closet_id: params[:closet_id], item_id: params[:id])
  end

  def destroy
    @closet = current_user.mycloset
    @closet_item = ClosetItem.find_by(closet_id: params[:closet_id], item_id: params[:id])
    @closet_item.delete
    redirect_to closet_path(@closet)
  end

  def showall
  end

  def comment
    @user = current_user
    @item = params[:id]
    @closet = params[:closet_id]
    @closet_item = ClosetItem.find_by(closet_id: params[:closet_id], item_id: params[:id])

  end

  private

  def item_params
    params.require(:item).permit(:name, :designer, closet_items_attributes: [:closet_id, :item_id, :comment, :note, :qauntity, :note, :size, :last_worn, :status, :bought, :season, :image])
    #name_id: []
  end

end
