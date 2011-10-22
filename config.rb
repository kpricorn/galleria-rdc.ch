# CodeRay syntax highlighting in Haml
# activate :code_ray

# Automatic sitemaps (gem install middleman-slickmap)
# require "middleman-slickmap"
# activate :slickmap

# Automatic image dimension calculations
# activate :automatic_image_sizes

# Per-page layout changes
# With no layout
# page "/path/to/file.html", :layout => false
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout

# Helpers
require "find"
require 'pp'
helpers do

  def page_title
    full_page_title.join(" - ")
  end

  def full_page_title
    page_title = [@site_name ||= "Galleria RdC"]
    page_title << @page_title
  end

  def body_id
    @body_id
  end

  def body_class
    class_names.join(" ")
  end

  def body_class_current_page
    current_page.gsub("/", "").gsub(".html", "")
  end

  def class_names
    body_class = [body_class_current_page]
    body_class << (@body_class unless @body_class.nil?)
  end

  def galleries
    { 
      "tueren" => {
        "picture-01" => { :name => "Galaxia", :year => "2007" },
        "picture-02" => { :name => "Curriculum vitae", :year => "1975" },
        "picture-03" => { :name => "Helios I", :year => "1975" },
        "picture-04" => { :name => "Helios II", :year => "1975" }
      },
      "bilder" => {
        "picture-01" => { :name => "Tagl d'aur", :description => "Basrelief, Acryl", :type => "Goldrahmen", :size => "855x855mm" },
        "picture-02" => { :name => "Goldener Schnitt", :description => "Basrelief, Acryl,", :type => "Goldrahmen", :size => "96x96cm" },
        "picture-03" => { :name => "Metropolis", :description => "mit Rotem Fluss", :type => "Acryl", :size => "64x64cm" },
        "picture-04" => { :name => "Metropolis METROPOLIS", :type => "Acryl", :size => "64x64cm" },
        "picture-05" => { :name => "Center", :type => "Hochrelief", :size => "61x61cm" },
        "picture-06" => { :name => "Miez plein A", :type => "Basrelief, Jute, Acryl", :size => "45x45cm" },
        "picture-07" => { :name => "Miez vit B", :type => "Basrelief, Jute, Acryl", :size => "45x45cm" },
        "picture-08" => { :name => "Tgau e tgil", :type => "Basrelief, Acryl", :size => "61x61cm" },
        "picture-09" => { :name => "Sguard el paradis", :description => "(ausklappbar, ge&ouml;ffnet)", :type => "Basrelief", :size => "836x836mm" },
        "picture-10" => { :name => "Anima", :description => "Basrelief, Blattgold", :type => "Acryl auf Holz", :size => "82x82cm" },
        "picture-11" => { :name => "Ratio", :description => "Basrelief, Blattgold", :type => "Acryl auf Holz", :size => "82x82cm" },
        "picture-12" => { :name => "Virgo", :description => "Basrelief, Blattgold", :type => "Acryl auf Holz", :size => "83x83cm" }
      }
    }
  end
 
  def build_gallery(folder)
    folder_relative = "images/#{folder}"
    folder_absolute = "#{Dir.pwd}/public/#{folder_relative}"
    Dir.glob("#{folder_absolute}/picture-*.jpg").each_with_index do |image, i|
      image_name = File.basename(image, ".jpg")
      haml_concat partial('shared/gallery_tile', :locals => {
        :image => "#{folder_relative}/#{image_name}.jpg",
        :thumb => "#{folder_relative}/#{image_name.gsub('picture-', 'thumb-')}.jpg",
        :rel => folder,
        :properties => galleries[folder][image_name]
      })

      if i % 4 == 3 then
        haml_tag :hr, {:class => 'clearfix'}
      end

    end

  end
end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build (gem install middleman-smusher)
  # require "middleman-smusher"
  # activate :smusher

  # Generate ugly/obfuscated HTML from Haml
  # activate :ugly_haml
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
