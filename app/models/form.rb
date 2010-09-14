class Form < ActiveRecord::Base
  belongs_to :user
  belongs_to :site

  has_many :documents
  
  validates_presence_of :user, :name

  validates_uniqueness_of :name, :message => 'Please give the questionnaire a unique name for easier identification'

  has_attached_file :spatial_data,
                    :storage => :s3,
                    :s3_credentials => { :access_key_id     => ENV['S3_KEY'], 
                                       :secret_access_key => ENV['S3_SECRET'] },
                    :path => "spatial_data/:id/:style_:extension",
                    :bucket => "icca-#{RAILS_ENV}-spatial-data"
end
