module CategoriesHelper

def collect(current_cat)
	until !current_cat.subcategories.nil?
		current_cat.subcategories.each {
			|item| 
			@collection.push(item)
			collect(item)
			}
	end
end

  
end
