class FragmentsController < ControversyController
  before_action :set_fragment, only: %i[ show edit analyze update destroy ]

  def index
    @fragments = @controversy.fragments.ordered
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

  def analyze
    @fragment.analyze_with_chatgpt!
    redirect_to [@controversy, @fragment], notice: "Fragment analysé"
  end

  def edit
    breadcrumbs
  end

  def create
    breadcrumbs
    @fragment = Fragment.new(fragment_params)
    @fragment.controversy = @controversy
    if @fragment.save
      redirect_to [@controversy, @fragment], notice: "Fragment créé"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    breadcrumbs
    if @fragment.update(fragment_params)
      redirect_to [@controversy, @fragment], notice: "Fragment modifié"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fragment.destroy
    breadcrumbs
    redirect_to controversy_fragments_url, notice: "Fragment supprimé"
  end

  protected

  def breadcrumbs
    super
    add_breadcrumb 'Fragments', controversy_fragments_path
    add_breadcrumb @fragment, [@controversy, @fragment] if @fragment.present? && @fragment.persisted?
  end

  def set_fragment
    @fragment = Fragment.find_by(slug: params[:slug])
  end

  def fragment_params
    params.require(:fragment)
          .permit(:title, :image, :full_text, :summary_short, :summary_long, :url, :url_import, :source, :analyze_answer, concept_ids: [])
  end
end
