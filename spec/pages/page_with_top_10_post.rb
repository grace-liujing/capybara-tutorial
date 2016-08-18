module PageWithTop10Post
  include Gizmo::PageMixin

  def valid?
    has_css?('.parent .right')
  end
end