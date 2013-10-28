class Drug < ActiveRecord::Base
  belongs_to :drugable, polymorphic: true
  has_many :instructions
end
