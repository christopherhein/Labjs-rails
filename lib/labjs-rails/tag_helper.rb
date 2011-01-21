module Labjs
  DEFAULT_DIR = "javascripts"
  
  module TagHelper
    
    def labjs_load(file, dir=DEFAULT_DIR)
      file = labjs_format(file, dir)
      "<script type=\"text/javascript\" src=\"#{file}\"></script>".html_safe
    end
    
    def labjs_include_tag(files = {}, dir=DEFAULT_DIR)
      scripts = "<script type=\"text/javascript\">"
      scripts += "$LAB"
      files.each do |type, file|
        file = labjs_format(file, dir)
        scripts += ".script('"+file+"')"
        if type =~ /require/
          scripts += ".wait()"
        end
      end
      scripts += "</script>"
      scripts.html_safe
    end
    
    def labjs_format(file, dir)
      file = "/#{dir}/#{file}" unless file =~ /\/?#{dir}/
      file.gsub!(/\/+/, '/')
      file = "#{file}.js" unless file =~ /\.js$/
      file = "/#{file}" unless file =~ /^\//
      return file
    end

  end
  
end