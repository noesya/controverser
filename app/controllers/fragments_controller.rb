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
    @fragment = Fragment.new
    breadcrumbs
    add_breadcrumb 'Ajouter un fragment'
  end

  def edit
    breadcrumbs
  end

  def create
    breadcrumbs
    @fragment = Fragment.new(fragment_params)
    @fragment.controversy = @controversy
    if @fragment.save
      redirect_to [@controversy, @text], notice: "Text was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    breadcrumbs
    if @fragment.update(fragment_params)
      redirect_to [@controversy, @text], notice: "Text was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fragment.destroy
    breadcrumbs
    redirect_to controversy_texts_url, notice: "Text was successfully destroyed."
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
