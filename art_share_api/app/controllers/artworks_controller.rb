class ArtworksController < ApplicationController
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork, status: :created
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def index
    # Change to show only artworks by a certain user, like so:
    # Artwork.artworks_for_user_id(params[:user_id]) ?
    artworks = Artwork.all
    render json: artworks
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  private
  def artwork_params
    artworks.require(:params).permit(:title, :image_url, :artist_id)
  end
end
