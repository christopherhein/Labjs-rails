module Labjs
  DEFAULT_DIR = "javascripts"
  
  module TagHelper
    
    def labjs_init(file, dir=DEFAULT_DIR)
      file = "/#{dir}/#{file}" unless file =~ /\/?#{dir}/
      file.gsub!(/\/+/, '/')
      file = "#{file}.js" unless file =~ /\.js$/
      file = "/#{file}" unless file =~ /^\//
      "<script type=\"text/javascript\" src=\"#{file}\"></script>".html_safe
    end
    
    def labjs_include_tag(required, files = [], dir=DEFAULT_DIR)
      scripts = "<script type=\"text/javascript\">"
      
      required = "/#{dir}/#{required}" unless required =~ /\/?#{dir}/
      required.gsub!(/\/+/, '/')
      required = "#{required}.js" unless required =~ /\.js$/
      required = "/#{required}" unless required =~ /^\//
      
      scripts += "$LAB.script('"+required+"').wait()"
      files.each do |file|
        file = "/#{dir}/#{file}" unless file =~ /\/?#{dir}/
        file.gsub!(/\/+/, '/')
        file = "#{file}.js" unless file =~ /\.js$/
        file = "/#{file}" unless file =~ /^\//
        scripts += ".script('"+file+"')"
      end
      scripts += "</script>"
      scripts.html_safe
    end

  end
  
end