helpers do
  def title
    title = "Galleria RdC"
    page_title = current_page.data.title
    if page_title.present?
      title = "#{page_title} | #{title}"
    end
    title
  end
end


set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :blog do |blog|
  blog.per_page = 3
  blog.prefix = "aktuell"
  blog.layout = "layouts/blog_article"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
  blog.summary_separator = /(READMORE)/
end

activate :livereload
activate :foundation_navigation
activate :bourbon
activate :directory_indexes

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :asset_hash
  activate :relative_assets
  activate :gzip
  require "middleman-smusher"
  activate :smusher
  activate :favicon_maker
  ignore "/styleguide/*"
end

activate :disqus do |d|
  d.shortname = "galleriardc"
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket      = 'galleria-rdc.ch'
  s3_sync.region      = 'eu-west-1'
  s3_sync.prefer_gzip = true
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-44091607-1'
end
