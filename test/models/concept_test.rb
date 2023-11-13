# == Schema Information
#
# Table name: concepts
#
#  id             :bigint           not null, primary key
#  description    :text
#  slug           :string
#  title          :string
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
require "test_helper"

class ConceptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
