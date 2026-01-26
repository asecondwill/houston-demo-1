# == Schema Information
#
# Table name: boats
# Database name: primary
#
#  id          :integer          not null, primary key
#  description :text
#  length      :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class BoatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
