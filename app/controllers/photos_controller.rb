class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @album = current_user.albums.find(params[:id])
    @photo = @album.build(photo_params)
    if @photo.save
      redirect_to @photo, status: :see_other, notice: "画像を保存しました"
    else
      flash.now[:alert] = "画像を保存できませんでした"
      render :new, status: :unprocessable_entity
    end

    def show
      @album = current_user.albums.find(params[:id])
      @photo = @album.photo
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:comment, {images: []})
  end
end
