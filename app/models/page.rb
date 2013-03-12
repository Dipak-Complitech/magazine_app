class Page < ActiveRecord::Base
  attr_accessible :content
  belongs_to :book
end
