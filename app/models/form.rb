class Form < ActiveRecord::Base
  belongs_to :user
  belongs_to :site

  has_many :documents
  
  validates_presence_of :user, :name

  validates_uniqueness_of :name, :message => 'Please give the questionnaire a unique name for easier identification'

  has_attached_file :spatial_data,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "spatial_data/:id/:style_:extension",
                    :bucket => "icca-#{RAILS_ENV}-spatial-data"
end