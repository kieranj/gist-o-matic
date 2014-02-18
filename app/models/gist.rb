class Gist < ActiveRecord::Base
  
  Languages = %w(Ruby Javascript Scala Go Python Objective-C)
    
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true
  validates :language, inclusion: { in: Languages }
  
  belongs_to :user
  
  scope :visible, -> { where(visible: true) }

  default_scope order(:created_at)

  before_create :generate_permalink

  def owner?(current_user)
    current_user == user
  end

  def to_param
    permalink
  end

  def self.from_param(permalink)
    where(permalink: permalink).first
  end

  private

    def generate_permalink
      self.permalink = SecureRandom.hex
    end
  
end
