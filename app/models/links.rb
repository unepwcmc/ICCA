class Links < ActiveRecord::Base
  attr_accessible :name, :link, :linkable_id, :linkable_type
end
