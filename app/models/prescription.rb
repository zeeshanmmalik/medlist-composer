class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :pharmacist
  has_many :drugs, as: :drugable, dependent: :destroy
  accepts_nested_attributes_for :drugs, allow_destroy: true

  scope :finalized, -> { where(status: 'final') }
  scope :editable, -> { where(status: 'editable') }

  def new?
    status == 'new'
  end
  def finalized?
    status == 'final'
  end
  def editable?
    status == 'editable'
  end
    
end
