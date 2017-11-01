module ApplicationHelper

	def md_to_html(text)
		options = {
	    filter_html: true,
	    link_attributes: {
	      rel: "nofollow",
	      target: "_blank"
	    }
	}

	extensions = {
	  space_after_headers: true,
	  autolink: true
	}
		if text.blank?

		else
			renderer = Redcarpet::Render::HTML.new(options)
			markdown = Redcarpet::Markdown.new(renderer, extensions)
			markdown.render(text).html_safe
		end

	end

	def number_to_percentage(number, options = {})
        delegate_number_helper_method(:number_to_percentage, number, options)
    end

    def current_user
    	current_member
    end

end
