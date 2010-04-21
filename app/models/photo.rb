class Photo < ActiveRecord::Base
  belongs_to :photoable, :polymorphic => true
  attr_accessible :title, :description
end
