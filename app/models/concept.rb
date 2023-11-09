# == Schema Information
#
# Table name: concepts
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  controversy_id :bigint           not null
#
# Indexes
#
#  index_concepts_on_controversy_id  (controversy_id)
#
# Foreign Keys
#
#  fk_rails_...  (controversy_id => controversies.id)
#
class Concept < ApplicationRecord
  include WithSlug

  belongs_to :controversy
  has_and_belongs_to_many :fragments

  validates_uniqueness_of :slug, scope: :controversy_id

  scope :ordered, -> { order(:name) }

  def to_param
    slug
  end

  def to_s
    "#{name}"
  end
end
