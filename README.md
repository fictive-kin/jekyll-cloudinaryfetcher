# Jekyll::CloudinaryFetcher

Custom Liquid Tag for Jekyll. Fetch remote images and apply transforms using Cloudinary.

## Requirements

- [Cloudinary](https://cloudinary.com/) account
- Publicly accessible URLs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-cloudinary_fetcher', group: :jekyll_plugins
```

And then execute:

    $ bundle install

## Usage

Add the following to your Jekyll config:

```YAML
cloudinary_cloud_name: <CLOUDINARY_CLOUD_NAME>
cloudinary_fetch_url: <PUBLIC_URL> # optional, defaults to site.url
```

Now you can use the `cloudinary_fetch` tag in any of your Liquid templates to 
make use of Cloudinary's Fetch feature.

```Liquid
<img src="{% cloudinary_fetch 'assets/image.png' %}">
<img src="https://res.cloudinary.com/<cloudinary_cloud_name>/image/fetch/<cloudinary_fetch_url>/image.png">
```

You can also combine transformations with the Fetch feature to transform your images.

```Liquid
<img src="{% cloudinary_url 'assets/image.png', w:600, q:auto, f:auto %}">
<img src="https://res.cloudinary.com/<cloudinary_cloud_name>/image/fetch/w_600,q_auto,f_auto/<cloudinary_fetch_url>/image.png">
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fictivekin/jekyll-cloudinaryfetcher.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
