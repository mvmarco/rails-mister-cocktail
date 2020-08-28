class DosesController < ApplicationController
  
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
       # strong_params = params.require(:name_of_model).permit(:attributes)
    @dose = Dose.new(strong_params)
    @dose.cocktail_id = params[:cocktail_id]
    if @dose.save
      # Redirect to the show page
      redirect_to cocktail_path(@dose.cocktail_id) #@dose.cocktail
    else
      @cocktail = @dose.cocktail
      render "cocktails/show"
    end
  end

  def strong_params
    return params.require(:dose).permit(:description, :ingredient_id)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
      redirect_to cocktail_path(@dose.cocktail_id)
  end

end
