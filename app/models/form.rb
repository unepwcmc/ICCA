class Form < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  
  validates_presence_of :user
end
