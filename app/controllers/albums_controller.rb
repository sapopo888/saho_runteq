class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:user) # includesメソッド：関連するテーブルをまとめてDBから取得
  end
end
