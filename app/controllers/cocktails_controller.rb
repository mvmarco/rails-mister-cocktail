class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all.order(created_at: :desc)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

 def create
       # strong_params = params.require(:name_of_model).permit(:attributes)
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      # Redirect to the show page
      redirect_to cocktails_path(@cocktail.id)
    else
      render :new
    end
  end

  def strong_params
    return params.require(:cocktail).permit(:name)
  end

  def destroy
        @cocktails = Cocktail.find(params[:id])
        @cocktails.destroy
           redirect_to cocktails_path
  end
  
end
