module ApplicationHelper
  
  def display_flash(klass = 'flash')
    flashes = flash.collect do |key,msg|
      content_tag :div, content_tag(:p, h(msg)), :class => "#{klass} #{key}"
    end.join.html_safe
  end
  
  def pluralize_with_suffix(count, word, singular_suffix, plural_suffix)
    pluralize(count, word) + " " + (count == 1 ? singular_suffix : plural_suffix)
  end
  
  
end
