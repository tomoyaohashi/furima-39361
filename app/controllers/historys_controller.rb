class HistorysController < ApplicationController
  def index
    @history_buy = HistoryBuy.new(item_id: params[:item_id])
  end

def create
  @history_buy = HistoryBuy.new(history_params)
  if @history_buy.valid?
    @history_buy.save
    redirect_to  root_path
  else
    render :index
  end
end

private

def history_params
  params.require(:history_buy).permit(:card_number, :card_month, :card_year, :card_cvc, :postal_id, :prefecture_id, :city, :address, :building, :phone).merge( user_id: current_user.id, item_id: params[:item_id])
end

end
