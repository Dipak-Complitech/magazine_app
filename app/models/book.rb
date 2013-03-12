class Book < ActiveRecord::Base
  attr_accessible :author, :name, :title
  has_many :pages
  accepts_nested_attributes_for :pages, allow_destroy: true

  validates :name, :title, :author, :presence => true

  def display_errors
    self.errors.full_messages.join(', ')
  end

end
