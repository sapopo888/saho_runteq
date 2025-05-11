class PhotosController < ApplicationController
  def new
    @album = current_user.albums.find(params[:album_id])
    @photo = current_user.photos.new
  end

  def create
    @album = current_user.albums.find(params[:album_id])
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      @album.photos << @photo # 中間テーブルに関連付け
      redirect_to album_path(@album), status: :see_other, notice: "画像を保存しました"
    else
      flash.now[:alert] = "画像を保存できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @album = current_user.albums.find(params[:id])
    @photos = @album.photos
  end

  private

  def photo_params
    params.require(:photo).permit(:comment, { images: [] })
  end
end
