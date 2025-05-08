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
      redirect_to albums_path, status: :see_other, notice: "アルバムを作成しました"
    else
      flash.now[:alert] = "アルバムを作成できませんでした"
      render :new
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
