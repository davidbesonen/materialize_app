class Condition < ApplicationRecord
  # belongs_to :condition_group_id
  has_many :condition_groups
end
