class Boat < ApplicationRecord
   def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "length", "name", "updated_at" ]
  end
end
