class Course < ApplicationRecord
  include PublicActivity::Model

  belongs_to :user

  validates :title, :short_description, :language, :level, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  has_rich_text :description
  extend FriendlyId
  friendly_id :title, use: :slugged

  LANGUAGES = [:English, :Russian, :Polish, :Spanish]

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:Beginner, :Intermediate, :Advanced]

  def self.levels
    LEVELS.map { |level| [level, level] }
  end

  tracked owner: Proc.new { |controller, model| controller.current_user }
end
