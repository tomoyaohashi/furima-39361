class HistorysController < ApplicationController
  def index
    @history = History.new(item_id: params[:item_id])
    
  end
end