class Category < ActiveRecord::Base
  attr_accessible :parent_id, :text, :title, :user_id
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id"
  has_many :contents, dependent: :destroy
  belongs_to :parent, class_name: "Category"
  belongs_to :user
  validates :title, :text, presence: true
end
