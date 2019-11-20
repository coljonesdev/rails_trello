class ListsController < ApplicationController
    def reorder
        list = List.find(params[:id])
        card1 = list.cards.find_by(order: params[:start])
        card2 = list.cards.find_by(order: params[:end])

        temp = card1.attributes['order']
        card1.update(order: card2.attributes['order'])
        card2.update(order: temp)

        card1.save
        card2.save

        redirect_to home_index_path
    end
end
