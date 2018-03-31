# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  # Secure password
  has_secure_password

  # Association
  has_many :posts, foreign_key: :created_by

  # Validations
  validates_presence_of :name, :email, :password_digest
end
