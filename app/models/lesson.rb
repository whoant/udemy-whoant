class Lesson < ApplicationRecord
  extend FriendlyId

  include PublicActivity::Model

  belongs_to :course
  validates :title, :content, :course, presence: true

  has_rich_text :content

  friendly_id :title, use: :slugged

  tracked owner: Proc.new { |controller, model| controller.current_user }

  def to_s
    title
  end
end
