class ListsController < ApplicationController
    def reorder
        list = List.find(params[:id])
        # card1 = list.cards.find_by(order: params[:start])
        # card2 = list.cards.find_by(order: params[:end])
        ordered_cards = (list.cards).sort_by &:order
        card1 = ordered_cards[params[:start].to_i]
        card2 = ordered_cards[params[:end].to_i]

        temp = card1.attributes['order']
        card1.update(order: card2.attributes['order'].to_i)
        card2.update(order: temp.to_i)

        card1.save
        card2.save

        redirect_to home_index_path
    end
end
