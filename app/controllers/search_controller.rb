class SearchController < ApplicationController
    def index
       if params[:query].present?
         @results = Opportunity.search(params[:query])
       else
         @opportunities = Opportunity.all
       end
     end
    end