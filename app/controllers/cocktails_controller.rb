class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

 def create
       # strong_params = params.require(:name_of_model).permit(:attributes)
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      # Redirect to the show page
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def strong_params
    return params.require(:cocktail).permit(:name)
  end

  def destroy
        @cocktails = Coctails.find(params[:id])
        @cocktails.destroy
           redirect_to cocktails_path
    end
  
end
