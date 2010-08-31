class Form < ActiveRecord::Base
  belongs_to :user
  belongs_to :site
  
  validates_presence_of :user

  has_attached_file :spatial_data,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "spatial_data/:id/:style_:extension",
                    :bucket => "icca-#{RAILS_ENV}-spatial-data"
end
