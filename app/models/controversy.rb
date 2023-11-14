# == Schema Information
#
# Table name: controversies
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  slug       :string
#  subtitle   :string
#  text       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Controversy < ApplicationRecord
  include WithSlug

  has_many :fragments
  has_many :concepts

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_uniqueness_of :slug

  def to_param
    slug
  end

  def to_s
    "#{title}"
  end
end
