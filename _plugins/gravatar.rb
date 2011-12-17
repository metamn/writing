require 'digest/md5'

module Jekyll
  class GravatarTag < Liquid::Tag

    def initialize(tag_name, email, tokens)
      super
      @email = email
    end

    def render(context)
      hash = Digest::MD5.hexdigest('cs@clair.ro') # for some reason @email not working ..
      image = "http://www.gravatar.com/avatar/#{hash}?s=512"
      "<img title='home' src='#{image}' />"
    end
  end
end

Liquid::Template.register_tag('gravatar', Jekyll::GravatarTag)
