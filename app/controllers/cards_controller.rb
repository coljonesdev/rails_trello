class CardsController < ApplicationController
    def create
        @list = List.find(params[:list_id])
        @card = @list.cards.create(list_id: params[:list_id], content: params[:content], order: 99)
        redirect_to home_index_path
    end

    private
        def card_params
            params.require(:content)
        end
end
