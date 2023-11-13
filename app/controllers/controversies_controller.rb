class ControversiesController < ApplicationController
  before_action :set_controversy, only: %i[ show edit update destroy ]

  def index
    @controversies = Controversy.all
  end

  def show
    @fragments = @controversy.fragments
    breadcrumbs
  end

  def new
    @controversy = Controversy.new
    breadcrumbs
  end

  def edit
    breadcrumbs
  end

  def create
    @controversy = Controversy.new(controversy_params)
    breadcrumbs
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
    breadcrumbs
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
    breadcrumbs
    respond_to do |format|
      format.html { redirect_to controversies_url, notice: "Controversy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def breadcrumbs
    super
    add_breadcrumb @controversy, @controversy if @controversy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_controversy
    @controversy = Controversy.find_by(slug: params[:slug])
  end

  # Only allow a list of trusted parameters through.
  def controversy_params
    params.require(:controversy).permit(:title, :subtitle, :text, :slug)
  end
end
