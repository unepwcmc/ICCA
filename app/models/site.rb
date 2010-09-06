class Site < ActiveRecord::Base
  belongs_to :country
  has_many :photos, :as => :photoable, :order => "preferred DESC"
  has_many :preferred_photos, :as => :photoable, :class_name => "Photo", :order => "preferred DESC", :limit => 3
  has_many :preferred_photo, :as => :photoable, :class_name => "Photo", :order => "preferred DESC", :limit => 1
  has_many :links, :as => :linkable
  has_many :documents

  validates_presence_of :country, :name, :extended_description
end
