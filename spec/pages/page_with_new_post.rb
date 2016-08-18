module PageWithNewPost
  include Gizmo::PageMixin

  def valid?
    has_css?('.new_post')
  end
end