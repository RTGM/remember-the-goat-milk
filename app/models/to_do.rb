class ToDo < ActiveRecord::Base
  include RankedModel
  ranks :order
  validates :content, presence: true
end
