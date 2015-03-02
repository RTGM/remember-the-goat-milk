class ToDo < ActiveRecord::Base
  include RankedModel
  ranks :row_order
  validates :content, presence: true
end
