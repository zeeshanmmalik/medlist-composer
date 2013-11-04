class Patient < ActiveRecord::Base
  has_many :prescriptions

  validates :mrn, presence: true, uniqueness: true

  def name
    "#{last_name.capitalize}, #{first_name.capitalize}"
  end
end
