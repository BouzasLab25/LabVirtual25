# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "alembic-jekyll-theme"
  spec.version       = "2.2.4"
  spec.authors       = ["David Darnes"]
  spec.email         = ["me@daviddarnes.com"]

  spec.summary       = %q{A Jekyll boilerplate theme designed to be a starting point for any Jekyll website.}
  spec.description   = "A Jekyll boilerplate theme designed to be a starting point for any Jekyll website. Rather than starting from scratch, this boilerplate is designed to get the ball rolling immediately."
  spec.homepage      = "https://alembic.darn.es"
  spec.license       = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.4"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 0.13"
  spec.add_runtime_dependency "jekyll-mentions", "~> 1.2"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.2"
  spec.add_runtime_dependency "jekyll-redirect-from", "~> 0.12"
  spec.add_runtime_dependency "jekyll-default-layout", "~> 0.1"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
  spec.add_runtime_dependency "jemoji", "~> 0.8"

  spec.add_development_dependency "bundler", "~> 1.14"
end
