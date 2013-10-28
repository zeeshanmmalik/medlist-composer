class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :pharmacist
  has_many :drugs, as: :drugable
end
