module ApplicationHelper
  def form_group_tag(errors, &block)
       css_class = 'form-group'
       css_class << ' has-error' if errors.any?
       content_tag :div, capture(&block), class: css_class
     end

     def caps(name)
       new_name = name.split
       new_name.each do |n|
         n.capitalize!
       end
       return new_name.join(" ")
     end
   end
