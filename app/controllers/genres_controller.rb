class GenresController < ApplicationController
  before_action :set_genre, only: %i[ edit update destroy ]
  before_action :only_admin

  def index
    @genres = Genre.all.page(params[:page])
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to genres_path, notice: "ジャンルが作成されました。" }
        format.json { render :index, status: :created, location: @genre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to genres_path, notice: "ジャンルが更新されました。" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to genres_url, notice: "ジャンルが削除されました。" }
      format.json { head :no_content }
    end
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
