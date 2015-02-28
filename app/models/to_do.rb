class ToDo < ActiveRecord::Base
  include RankedModel
  ranks :order
  validates :content, :order, presence: true
end
