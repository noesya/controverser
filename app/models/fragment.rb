# == Schema Information
#
# Table name: fragments
#
#  id             :bigint           not null, primary key
#  full_text      :text
#  image          :text
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

  belongs_to :controversy

  def to_param
    slug
  end

  def to_s
    "#{title}"
  end
end
