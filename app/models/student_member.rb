# frozen_string_literal: true

class StudentMember < ApplicationRecord
  enum member_title: { member: 1, officer: 2 }
  validates :uin, :first_name, :last_name, :class_year, :email, presence: true

  after_create :update_google_params

  def update_google_params
    self.uid = User.where(email: email).pick(:uid)
    # SELECT uid FROM user WHERE email = email
    # TODO
    # self.picture
    save!
  end
end
