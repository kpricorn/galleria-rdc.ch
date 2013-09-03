###
# Helpers
###

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :livereload

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :relative_assets
  require "middleman-smusher"
  activate :smusher
end
