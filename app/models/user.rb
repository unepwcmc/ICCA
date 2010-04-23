class User < ActiveRecord::Base
  acts_as_authentic

  belongs_to :role

  def role? role
    self.role.present? && role == self.role.name.to_sym
  end
end
