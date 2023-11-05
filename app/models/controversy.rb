# == Schema Information
#
# Table name: controversies
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Controversy < ApplicationRecord
  before_save :set_slug

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_param
    slug
  end

  def to_s
    "#{name}"
  end

  protected

  def set_slug
    self.slug = name.parameterize
  end
end
