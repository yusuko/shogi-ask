
module ApplicationHelper
  def text_with_link(text)
    Rinku.auto_link(simple_format(h(text))).html_safe
  end
end
