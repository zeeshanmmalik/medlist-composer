class Patient < ActiveRecord::Base
  has_many :prescriptions

  def name
    "#{last_name.capitalize}, #{first_name.capitalize}"
  end
end
