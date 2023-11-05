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

  def to_s
    "#{name}"
  end
end
