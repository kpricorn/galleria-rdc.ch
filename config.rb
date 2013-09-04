###
# Helpers
###

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :livereload
activate :foundation_navigation
activate :bourbon
activate :directory_indexes

activate :blog do |blog|
  blog.prefix = "blog"
  blog.layout = "layouts/blog"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :relative_assets
  require "middleman-smusher"
  activate :smusher
  activate :favicon_maker
end

activate :disqus do |d|
  d.shortname = "galleriardc"
end
