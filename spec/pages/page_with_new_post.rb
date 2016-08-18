module PageWithNewPost
  include Gizmo::PageMixin

  define_action :fill_post do |title, content|
    fill_in('post_title', with: title)
    fill_in('post_content', with: content)
  end

  define_action :back_to_home do
    find('.back').click
  end

  define_action :create_post do
    find('.actions input[value="Create Post"]').click
  end
end