module PageWithTop10Post
  include Gizmo::PageMixin

  def valid?
    has_css?('.parent .right')
  end

  def top_10_list_item
    find('.top-10-list').find('li')
  end
end