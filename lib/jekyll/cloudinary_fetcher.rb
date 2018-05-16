require "jekyll/cloudinary_fetcher/version"
require "jekyll"
require "uri"

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

        if context[@filepath].nil?
          return
        end

        if cloud_name.nil?
          return "#{context[@filepath]}"
        end

        if site.config["cloudinary_fetch_url"].nil?
          site_url = site.config["url"]
        else
          site_url = site.config["cloudinary_fetch_url"]
        end

        asset_url = URI.join(site_url, context[@filepath])
        asset_ext = File.extname(context[@filepath])
        skip_transform = site.config["cloudinary_fetch_skip_transform"] || []

        if @transforms.empty? or skip_transform.include? asset_ext
          return "#{cloudinary_url}/#{asset_url}"
        end

        return "#{cloudinary_url}/#{@transforms.join(',')}/#{asset_url}"
      end

    end
  end
end

Liquid::Template.register_tag("cloudinary_fetch", Jekyll::CloudinaryFetcher::Fetch)