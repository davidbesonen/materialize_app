# https://guides.rubyonrails.org/active_record_validations.html
class ConditionGroup < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
end
