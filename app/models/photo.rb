class Photo < ActiveRecord::Base
  belongs_to :photoable, :polymorphic => true

  has_attached_file :image,
    :styles => {
      :small => "106x80#",
      :medium => "190x209#",
      :banner => "938x346#",
      :full => "700x525>"
    },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :url => ":s3_domain_url",
    :path => "avatars/:id/:style_:extension",
    :bucket => "icca-#{RAILS_ENV}-images"
end
