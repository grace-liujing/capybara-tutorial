module PageWithPostList
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .left')
	end

	def posts_in_list
		find('.parent .left table').find('tbody').all('tr')
	end

	def notice_message
		find('#notice').text
	end

  define_action :new_a_post do
		find('.parent .left a[href="/posts/new"]').click
  end
end