class User < ActiveRecord::Base
  acts_as_authentic

  belongs_to :role
  after_create :create_survey_id

  validates_uniqueness_of :username
  validates_presence_of :username
  validates_length_of :username, :maximum => 50

  def role? role
    self.role.present? && role == self.role.name.to_sym
  end

  def create_survey_id
    self.survey_id = self.id.to_s + "_" + self.username.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').split(" ").map{|x| x.gsub(/\W/,'').titleize}.join(" ").split(" ").join("_")
    self.save
  end
end
