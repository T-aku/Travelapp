class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end
  
  def create
    country = Country.find_by(countryname: params[:product][:countryname])
    @product = Product.new(productname: params[:product][:productname], comment: params[:product][:comment], image: params[:product][:image],country_id: country.id, user_id: current_user.id, image_cache: params[:product][:image_cache])
    if @product.save
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
    if (@product.image.blank?) then
    else
     @product.image.cache!
    end
  end
  
  def update
    country = Country.find_by(countryname: params[:product][:countryname])
    @product = Product.find(params[:id])
    if @product.update(productname: params[:product][:productname], comment: params[:product][:comment], image: params[:product][:image],country_id: country.id, user_id: current_user.id)
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to users_path
  end
  
  
end