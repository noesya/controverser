class FragmentsController < ControversyController
  before_action :set_fragment, only: %i[ show edit update destroy ]

  def index
    @fragments = @controversy.fragments
    breadcrumbs
  end

  def show
    breadcrumbs
  end

  def new
    @fragment = Text.new
    breadcrumbs
    add_breadcrumb 'Ajouter un texte'
  end

  def edit
    breadcrumbs
  end

  def create
    breadcrumbs
    @fragment = Fragment.new(fragment_params)
    @fragment.controversy = @controversy
    respond_to do |format|
      if @fragment.save
        format.html { redirect_to [@controversy, @text], notice: "Text was successfully created." }
        format.json { render :show, status: :created, location: @text }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    breadcrumbs
    respond_to do |format|
      if @fragment.update(text_params)
        format.html { redirect_to [@controversy, @text], notice: "Text was successfully updated." }
        format.json { render :show, status: :ok, location: @text }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fragment.destroy
    breadcrumbs
    respond_to do |format|
      format.html { redirect_to controversy_texts_url, notice: "Text was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumbs
    super
    add_breadcrumb @fragment, [@controversy, @fragment] if @fragment.present? && @fragment.persisted?
  end

  def set_fragment
    @fragment = Fragment.find_by(slug: params[:slug])
  end

  def fragment_params
    params.require(:fragment).permit(:title, :image, :full_text, :summary_short, :summary_long, :url, :source)
  end
end
