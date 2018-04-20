module ApplicationHelper
  def fancy_popup(title, options = {})

    # My default options
    options.reverse_merge!(
      id: 'fancy-close'
    )

    render "shared/fancy_popup", title: title, options: options do
      yield
    end
  end

  def fancy_popup_link(title, options = {})
    # My default options
    options.reverse_merge!(
      target: 'fancy-close'
    )

    content_tag(:p) do
      content_tag(:span, title, class: 'fancyalert', data: { target: options[:target] })
    end
  end
end
