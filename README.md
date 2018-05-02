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

| Name | Default | Description |
| - | - | - |
| `cloudinary_cloud_name` |  | "Cloud name" assigned in https://cloudinary.com/ |
| `cloudinary_fetch_url` | `site.url` | Publicly accessible URL |
| `cloudinary_fetch_skip_transform` | `[]` | Global list of file formats to which [Cloudinary transforms](https://cloudinary.com/documentation/image_transformation_reference) should never be applied |

Now you can use the `cloudinary_fetch` tag in any of your Liquid templates to 
make use of Cloudinary's Fetch feature.

```Liquid
<img src="{% cloudinary_fetch 'assets/image.png' %}">
```
```HTML
<img src="https://res.cloudinary.com/<cloudinary_cloud_name>/image/fetch/<cloudinary_fetch_url>/image.png">
```

You can also combine transformations with the Fetch feature to transform your images.

```Liquid
<img src="{% cloudinary_fetch 'assets/image.png', w:600, q:auto, f:auto %}">
```
```HTML
<img src="https://res.cloudinary.com/<cloudinary_cloud_name>/image/fetch/w_600,q_auto,f_auto/<cloudinary_fetch_url>/image.png">
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fictivekin/jekyll-cloudinaryfetcher.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
