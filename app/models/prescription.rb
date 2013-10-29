class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :pharmacist
  has_many :drugs, as: :drugable, dependent: :destroy
  accepts_nested_attributes_for :drugs, allow_destroy: true
end
