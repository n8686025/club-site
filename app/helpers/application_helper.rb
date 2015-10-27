module ApplicationHelper

	# Return the full title on per page basis.
	# In the case a title is not provided in .html.erb 
	# using <% provide... %>

	def full_title(page_title = '')
		base_title = "QUT Japan"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end
	
end
