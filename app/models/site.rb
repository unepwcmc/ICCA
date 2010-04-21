class Site < ActiveRecord::Base
  belongs_to :country
  has_many :photos, :as => :photoable

  validates_presence_of :country, :name, :extended_description
end
