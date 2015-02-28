class ToDo < ActiveRecord::Base
  validates :content, :order, presence: true  
end
