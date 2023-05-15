class HistorysController < ApplicationController
  def index
    if user_signed_in? && Item.find(params[:item_id]).user_id != current_user.id && !History.exists?(item_id: params[:item_id])
      @history_buy = HistoryBuy.new(item_id: params[:item_id])
    else
      redirect_to  root_path
    end
  end

  def create
    @history_buy = HistoryBuy.new(history_params)
    if @history_buy.valid?
      pay_item
      @history_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_params
    params.require(:history_buy).permit(:postal_id, :prefecture_id, :city, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(@history_buy.item_id).price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end
end
