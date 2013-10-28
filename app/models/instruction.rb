class Instruction < ActiveRecord::Base
  belongs_to :drug

  def as_json(*args)
    {
      line: line
    }
  end
end
