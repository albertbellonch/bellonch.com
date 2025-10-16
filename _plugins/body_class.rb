class BodyClassTag < Liquid::Tag
  def render(context)
    page = context.environments.first['page']
    classes = []

    %w[class url categories tags layout].each do |prop|
      value = page[prop]
      next unless value

      if page[prop].is_a?(Array)
        value.each { |proper| classes.push generate_body_class(prop, proper) }
      else
        classes.push generate_body_class(prop, value)
      end
    end

    classes.join(' ')
  end

  private

  def generate_body_class(prefix, id)
    # Remove extension from url, replace '-' and '/' with underscore, Remove leading '_'
    id = id
         .gsub(/\.\w*?$/, '')
         .gsub(%r{[-/]}, '_')
         .gsub(/^_/, '')

    prefix = case prefix
             when 'class'
               ''
             else
               "#{prefix}_"
             end

    "#{prefix}#{id}"
  end
end

Liquid::Template.register_tag('body_class', BodyClassTag)
