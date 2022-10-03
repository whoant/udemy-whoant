class User < ApplicationRecord
  extend FriendlyId
  rolify
  has_many :courses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  validate :must_have_a_role, on: :update
  after_create :assign_default_role

  friendly_id :email, use: :slugged

  def to_s
    email
  end

  def username
    self.email.split(/@/).first
  end

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher)
    end
  end

  def online?
    updated_at > 2.minutes.ago
  end

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least one role")
    end
  end

end
