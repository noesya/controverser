class ConceptsController < ControversyController
  before_action :set_concept, only: %i[ show edit update destroy ]

  def index
    @concepts = @controversy.concepts
    breadcrumbs
  end
  
  def show
    @fragments = @concept.fragments
    breadcrumbs
  end
  
  def new
    @concept = Concept.new
    breadcrumbs
    add_breadcrumb 'Ajouter un concept'
  end

  def edit
    breadcrumbs
  end

  def create
    @concept = Concept.new(concept_params)
    @concept.controversy = @controversy
    if @concept.save
      redirect_to [@controversy, @concept], notice: "Concept was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @concept.update(concept_params)
      redirect_to [@controversy, @concept], notice: "Concept was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @concept.destroy
    redirect_to controversy_concepts_url, notice: "Concept was successfully destroyed."
  end

  protected

  def breadcrumbs
    super
    add_breadcrumb 'Concepts', controversy_concepts_path
    add_breadcrumb @concept, [@controversy, @concept] if @concept.present? && @concept.persisted?
  end

  def set_concept
    @concept = Concept.find_by(slug: params[:slug])
  end

  def concept_params
    params.require(:concept).permit(:name, :slug, :description, fragment_ids: [])
  end
end
