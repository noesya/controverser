class ControversiesController < ApplicationController
  before_action :set_controversy, only: %i[ show edit update destroy ]

  def index
    @controversies = Controversy.all
  end

  def show
    @fragments = @controversy.fragments
  end

  def new
    @controversy = Controversy.new
    @controversy.data = {
        blocks: []
    }.to_json
  end

  def edit
  end

  def create
    @controversy = Controversy.new(controversy_params)
    if @controversy.save
      redirect_to controversy_url(@controversy), notice: "Controversy was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # TODO manage empty editorjs data, crash
    if @controversy.update(controversy_params)
      redirect_to controversy_url(@controversy), notice: "Controversy was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @controversy.destroy
    redirect_to controversies_url, notice: "Controversy was successfully destroyed."
  end

  protected

  def set_controversy
    @controversy = Controversy.find_by(slug: params[:slug])
  end

  def controversy_params
    params.require(:controversy).permit(:title, :subtitle, :text, :slug, :data)
  end
end
