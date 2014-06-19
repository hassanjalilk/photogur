class PicturesController < ApplicationController

  def index
    if params[:after]
      @most_recent_pictures = Picture.where("created_at > ?", Time.current - params[:after].to_i.months)
    else
      @most_recent_pictures = Picture.most_recent_five
    end
		# @pictures = Picture.all
	end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
  	@picture = Picture.new
  end

  def create
  	@picture = Picture.new(picture_params)
  	if @picture.save
  		redirect_to pictures_url
  	else
  		render :new
  	end
  end

  def edit
  	@picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update_attributes(picture_params)
    redirect_to root_path
  end

   def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
   end

  private
  def picture_params
  	params.require(:picture).permit(:artist, :title, :url)
  end

end








