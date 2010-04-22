class Photo < ActiveRecord::Base
  belongs_to :photoable, :polymorphic => true
#  attr_accessible :title, :description, :photoable_id, :photoable_type

  has_attached_file :image,
                    :styles => {
                            :small => "106x80#",
                            :medium => "190x209#"
                            },
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "avatars/:id/:style_:extension",
                    :bucket => "icca-#{RAILS_ENV}-images"
end
