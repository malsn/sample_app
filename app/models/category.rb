class Category < ActiveRecord::Base
  attr_accessible :parent_id, :text, :title, :user_id
  belongs_to :user  
end
