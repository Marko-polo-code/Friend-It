class RecommendationsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    @recommendation = Recommendation.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.flat = @flat
    if @recommendation.save
      redirect_to flat_path(@flat)
    else
      render :new 
    end
  end

  def update
    set_recommendation
    @recommendation.update(recommendation_params)
  end

  def edit
    set_recommendation
  end

  def destroy
    set_recommendation
    authorize @recommendation
    @recommendation.destroy
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:name, :address, :description)
  end
end

