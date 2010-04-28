class Site < ActiveRecord::Base
  belongs_to :country
  has_many :photos, :as => :photoable, :order => "preferred DESC"
  has_many :preferred_photos, :as => :photoable, :class_name => "Photo", :order => "preferred DESC", :limit => 3
  has_many :links, :as => :linkable

  validates_presence_of :country, :name, :extended_description
end
