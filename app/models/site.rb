class Site < ActiveRecord::Base
  belongs_to :country
  has_many :photos, :as => :photoable
  has_many :links, :as => :linkable

  validates_presence_of :country, :name, :extended_description
end
