class Document < ActiveRecord::Base
  belongs_to :form
  belongs_to :site

  validates_presence_of :name, :doc

  has_attached_file :doc,
                    :storage => :s3,
                    :s3_credentials => { :access_key_id     => ENV['S3_KEY'], 
                                       :secret_access_key => ENV['S3_SECRET'] },
                    :path => "docs/:id/:style_:extension",
                    :bucket => "icca-#{RAILS_ENV}-documents"
end
