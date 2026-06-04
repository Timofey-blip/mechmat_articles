class Article < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  # Устанавливаем значения по умолчанию
  after_initialize :set_defaults, if: :new_record?
  
  private
  
  def set_defaults
    self.views_count ||= 0
    self.is_published ||= false
  end
end
