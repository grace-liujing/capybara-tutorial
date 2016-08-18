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
		find('.parent .left .new').click
  end

	define_action :edit_post do
		find('.parent .left .edit').click
  end

	define_action :destroy_post do
		find('.parent .left .destroy').click
  end

	define_action :destroy_post do
		find('.destroy').click
		page.driver.browser.switch_to.alert.accept
	end
end