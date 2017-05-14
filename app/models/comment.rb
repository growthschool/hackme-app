class Comment < ApplicationRecord

  belongs_to :event
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"

  def can_deleted_by(user)
    user && ( user.is_admin? || user == self.author )
  end

end
