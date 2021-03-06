class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, through: :answers

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user

  validates :title, presence: true, uniqueness: {scope: :body} #checks for combined uniqueness of body AND title
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
   def user_first_name 
    user.first_name if user
   end 

   # def to_param
   #  "#{id}-#{title}".parameterize
   # end 
   extend FriendlyId
   friendly_id :title, use: :slugged

   def likes_count
     likes.count
   end 

   def favorites_count
     favorites.count
   end 

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
