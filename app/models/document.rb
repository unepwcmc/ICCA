class Document < ActiveRecord::Base
  belongs_to :form
  belongs_to :site

  validates_presence_of :name, :doc

  has_attached_file :doc,
    :url => ":s3_domain_url",
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "docs/:id/:style_:extension",
    :bucket => "icca-#{RAILS_ENV}-documents"
end
