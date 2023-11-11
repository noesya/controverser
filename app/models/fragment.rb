# == Schema Information
#
# Table name: fragments
#
#  id             :bigint           not null, primary key
#  full_text      :text
#  image          :text
#  published_at   :date
#  slug           :string
#  source         :text
#  summary_long   :text
#  summary_short  :text
#  title          :string
#  url            :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  controversy_id :bigint           not null
#
# Indexes
#
#  index_fragments_on_controversy_id  (controversy_id)
#
# Foreign Keys
#
#  fk_rails_...  (controversy_id => controversies.id)
#
class Fragment < ApplicationRecord
  include WithSlug

  attr_accessor :url_import

  belongs_to :controversy
  has_and_belongs_to_many :concepts

  validates_presence_of :title
  validates_uniqueness_of :slug, scope: :controversy_id

  scope :ordered, -> { order(:title) }

  def url_import=(value)
    self.url = value
    page = Curation::Page.new value
    self.title = page.title
    self.full_text = page.text
    self.image = page.image
    self.published_at = page.date
  end

  def to_param
    slug
  end

  def to_s
    "#{title}"
  end
end
