require "jekyll/cloudinary_fetcher/version"

module Jekyll
  module CloudinaryFetcher
    class Fetch < Liquid::Tag

      def initialize(tag_name, markup, tokens)
        super

        @transforms = []
        @filepath = markup.split(",")[0].strip

        # Liquid provides no built-in mechanism for accessing tag variables.
        # Therefore, we must scan the provided markup for anything that matches
        # a tag attribute pattern, i.e. "foo: bar".
        markup.scan(Liquid::TagAttributes) do |k, v|
          formatted_value = v.strip.gsub(/^['|"]/, '').gsub(/['|"]$/, '')
          @transforms.push("#{k}_#{formatted_value}")
        end
      end

      def render(context)
        site = context.registers[:site]
        cloud_name = site.config["cloudinary_cloud_name"]
        cloudinary_url = "https://res.cloudinary.com/#{cloud_name}/image/fetch"

        if cloud_name.nil?
          return "#{context[@filepath]}"
        end

        if site.config["cloudinary_fetch_url"].nil?
          site_url = site.config["url"]
        else
          site_url = site.config["cloudinary_fetch_url"]
        end

        asset_url = URI.join(site_url, context[@filepath])

        if @transforms.empty?
          return "#{cloudinary_url}/#{asset_url}"
        end

        return "#{cloudinary_url}/#{@transforms.join(',')}/#{asset_url}"
      end

    end
  end
end

Liquid::Template.register_tag("cloudinary_fetch", Jekyll::CloudinaryFetcher)