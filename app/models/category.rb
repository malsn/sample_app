class Category < ActiveRecord::Base
  attr_accessible :parent_id, :text, :title, :user_id
  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true, length: { maximum: 500 }
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Category"
  belongs_to :user
end
