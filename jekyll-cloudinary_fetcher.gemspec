
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll/cloudinary_fetcher/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-cloudinary_fetcher"
  spec.version       = Jekyll::CloudinaryFetcher::VERSION
  spec.authors       = ["bedrich"]
  spec.email         = ["bedrich@fictivekin.com"]

  spec.summary       = "Custom Liquid Cloudinary Tag for Jekyll"
  spec.description   = "Fetch remote images and apply transforms using Cloudinary"
  spec.homepage      = "https://github.com/fictivekin/jekyll-cloudinaryfetcher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.3"
  
  spec.add_runtime_dependency "jekyll", "~> 3.5"
  
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
