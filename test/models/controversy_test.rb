# == Schema Information
#
# Table name: controversies
#
#  id            :bigint           not null, primary key
#  data          :jsonb
#  data_rendered :text
#  slug          :string
#  subtitle      :string
#  text          :text
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class ControversyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
