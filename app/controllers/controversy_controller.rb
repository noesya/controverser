class ControversyController < ApplicationController
  before_action :load_controversy

  protected

  def breadcrumbs
    super
    add_breadcrumb @controversy, @controversy
  end

  def load_controversy
    @controversy = Controversy.find_by(slug: params[:controversy_slug])
  end
end
