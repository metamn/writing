module Jekyll
  class TitleizeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text.split(' ').each{|word| word.capitalize!}.join(' ')}"
    end
  end
end

Liquid::Template.register_tag('titleize', Jekyll::TitleizeTag)
