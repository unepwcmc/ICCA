class Country < ActiveRecord::Base
  has_many :sites
  has_many :photos, :as => :photoable

  validates_presence_of :name, :description, :extended_description
end
