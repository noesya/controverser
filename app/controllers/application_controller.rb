class ApplicationController < ActionController::Base

  protected

  def breadcrumbs
    add_breadcrumb @controversy, @controversy if @controversy
  end
end
