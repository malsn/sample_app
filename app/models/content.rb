class Content < ActiveRecord::Base
  attr_accessible :text, :title
  belongs_to :category
end
