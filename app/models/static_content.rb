class StaticContent < ActiveRecord::Base
  
  validates_presence_of [:content_for, :body]
  
  def validate_on_update
    if changes.include? "content_for"
      errors.add("content_for", "cannot be modified. contact the administrator")
    end
  end     
end
