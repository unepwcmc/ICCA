class Site < ActiveRecord::Base
  belongs_to :country

  validates_presence_of :country, :name, :extended_description
end
