class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end
  
  def create
    country = Country.find_by(name: params[:product][:country_name])
    @product = Product.new(name: params[:product][:product_name], comment: params[:product][:comment], image: params[:product][:image],country_id: country.id, user_id: current_user.id)
    if @product.save
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  
end