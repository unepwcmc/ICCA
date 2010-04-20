class Country < ActiveRecord::Base
  validates_presence_of :name, :description, :extended_description
end
