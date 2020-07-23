class PlantTagsController < ApplicationController

  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])

    @tags = Tag.where(id: params[:plant_tag][:tag])

    @tags.each do |tag|
      PlantTag.create!(
        tag_id: tag.id, 
        plant_id: @plant.id
      )
    end
    
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
