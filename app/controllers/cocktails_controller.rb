class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @doses = Dose.where(cocktail_id: params[:id])
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
