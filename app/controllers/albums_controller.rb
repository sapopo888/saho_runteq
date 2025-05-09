class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:user).order(created_at: :desc) # includesメソッド：関連するテーブルをまとめてDBから取得
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      # ここあとで変更する
      redirect_to albums_path, status: :see_other, notice: t("defaults.flash_message.created", item: Album.model_name.human)
    else
      flash.now[:alert] = t("defaults.flash_message.not_created", item: Album.model_name.human)
      render :new, status: :unprocessable_entity # 作成失敗した時にエラーメッセージ表示させるために必要！
    end

    def show
      @album = Album.find(params[:id])
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :description)
  end
end
