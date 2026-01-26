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
class Boat < ApplicationRecord
   def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "length", "name", "updated_at" ]
  end
end
