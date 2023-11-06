module WithSlug
  extend ActiveSupport::Concern

  included do
    before_save :set_slug
  end

  protected

  def set_slug
    self.slug = to_s.parameterize
  end
end