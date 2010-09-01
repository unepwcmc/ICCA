class Document < ActiveRecord::Base
  belongs_to :form

  validates_presence_of :name, :doc, :form

  has_attached_file :doc,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "docs/:id/:style_:extension",
                    :bucket => "icca-#{RAILS_ENV}-documents"
end
