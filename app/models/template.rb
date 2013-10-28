class Template < ActiveRecord::Base
  has_many :drugs, as: :drugable
  accepts_nested_attributes_for :drugs, allow_destroy: true
end
