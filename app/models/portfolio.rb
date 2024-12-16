class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle:'Ruby on Rails') }

  # Active Record callback, called when doing a new or loading record
  after_initialize :set_defaults

  def set_defaults
    # ||= only sets the value if it is nil
    self.main_image ||= Placeholder.image_generator(height: '650', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
