class Template < ActiveRecord::Base
  has_many :drugs, as: :drugable
end
