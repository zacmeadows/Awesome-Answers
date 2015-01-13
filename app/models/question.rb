class Question < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :body}
  validates :body, presence: {message: "must be provided!"}

  validates :view_count, numericality: {greater_than_or_equal_to: 0}

  validate :stop_words

  after_initialize :set_defaults

  before_save :capitalize_title

  scope :recent, lambda {|x| order("updated_at DESC").limit(x) }
  # => def self.recent(number)
  # =>   order("updated_at_DESC").limit(number)
  # => end

   scope :last_days, lambda {|x| where(created_at: x.days.ago..Time.now) }
   # scope :last_days, lambda {|num| where("created_at > ?", num.days.ago) }

  def self.recent(number)
    Question.order("updated_at DESC").limit(number)  
  end

  private 
    
  def stop_words
    if title.present? && title.include?("monkey")
      errors.add(:title, "please don't use monkey!")
    end 
  end

  def set_defaults 
    self.view_count ||= 0 
  end 

  def capitalize_title
    self.title.capitalize!
  end

end
