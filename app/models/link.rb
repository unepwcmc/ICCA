class Link < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true
  
  attr_accessible :name, :link, :linkable_id, :linkable_type
end
