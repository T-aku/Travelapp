class SearchController < ApplicationController
  
  def index
    @country = Country.find_by(countryname: params[:search][:search_content])
    if @country
      render 'countries/show'
    else
      @products = Product.where("productname LIKE ?", "%#{params[:search][:search_content]}%")
      if !@products.blank?
        render 'show'
      else
        render 'error'
      end
    end
  end
  
  
end