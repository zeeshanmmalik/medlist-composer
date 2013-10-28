class Drug < ActiveRecord::Base
  belongs_to :drugable, polymorphic: true
  has_many :instructions
  accepts_nested_attributes_for :instructions, allow_destroy: true

  def as_json(*args)
    {
      generic_name: generic_name,
      strength: strength,
      brand_name: brand_name,
      purpose: purpose,
      instructions: instructions.as_json,
      am_check: am_check,
      am_time: am_time,
      noon_check: noon_check,
      noon_time: noon_time,
      supper_check: supper_check,
      supper_time: supper_time,
      bedtime_check: bedtime_check,
      bedtime_time: bedtime_time
    }
  end
end
