class StocksController < ApplicationController

    def search 
        if params[:stock].present?
          @stock = Stock.new_lookup(params[:stock])
          if @stock
            respond_to do |format|
                format.js { render partial: 'users/result' }
            end
          else 
            respond_to do |format|
                flash.now[:alert] = "The symbol you entered is invalid. Please enter a valid symbol."
                format.js { render partial: 'users/result' }
            end
          end 
        else 
            respond_to do |format|
                flash.now[:alert] = "Please Enter a Symbol to Search"
                format.js { render partial: 'users/result' }
            end
        end 
        
    end 


end 