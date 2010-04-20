class Country < ActiveRecord::Base
  has_many :sites
  
  validates_presence_of :name, :description, :extended_description
end
