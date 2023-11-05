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
require "test_helper"

class ControversyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
