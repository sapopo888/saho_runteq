class AlbumsController < ApplicationController
  def index
    @albums = current_user.albums.order(created_at: :desc) # includesメソッド：関連するテーブルをまとめてDBから取得
  end

  def new
    @album = current_user.albums.new
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      # ここあとで変更する
      redirect_to new_album_photo_path(@album), status: :see_other, notice: t("defaults.flash_message.created", item: Album.model_name.human)
    else
      flash.now[:alert] = t("defaults.flash_message.not_created", item: Album.model_name.human)
      render :new, status: :unprocessable_entity # 作成失敗した時にエラーメッセージ表示させるために必要！
    end
  end

  def show
    @album = current_user.albums.find(params[:id])
    @photos = @album.photos
  end

  private

  def album_params
    params.require(:album).permit(:title, :description)
  end
end
