class ControversiesController < ApplicationController
  before_action :set_controversy, only: %i[ show edit update destroy ]

  def index
    @controversies = Controversy.all
  end

  def show
    @doc = EditorJs::Document.new @controversy.data
    @html = @doc.render
    @fragments = @controversy.fragments
  end

  def new
    @controversy = Controversy.new
  end

  def edit
  end

  def create
    @controversy = Controversy.new(controversy_params)
    respond_to do |format|
      if @controversy.save
        format.html { redirect_to controversy_url(@controversy), notice: "Controversy was successfully created." }
        format.json { render :show, status: :created, location: @controversy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @controversy.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @controversy.update(controversy_params)
        format.html { redirect_to controversy_url(@controversy), notice: "Controversy was successfully updated." }
        format.json { render :show, status: :ok, location: @controversy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @controversy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @controversy.destroy
    respond_to do |format|
      format.html { redirect_to controversies_url, notice: "Controversy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  protected

  def set_controversy
    @controversy = Controversy.find_by(slug: params[:slug])
  end

  def controversy_params
    params.require(:controversy).permit(:title, :subtitle, :text, :slug, :data)
  end
end
