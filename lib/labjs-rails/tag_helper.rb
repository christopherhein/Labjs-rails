module Labjs
  DEFAULT_DIR = "javascripts"
  
  module TagHelper
    
    def labjs_load(file, dir=DEFAULT_DIR)
      file = labjs_format(file, dir)
      "<script type=\"text/javascript\" src=\"#{file}\"></script>".html_safe
    end
    
    def labjs_include_tag(*sources)
      options = sources.extract_options!
      scripts = "<script type=\"text/javascript\">"
      scripts += "$LAB"
      options.each do |key, value|
        if key.to_s == "require"
          value.each do |file|
            script = labjs_format(file)
            scripts += ".script('#{script}').wait()"
          end
        end
      end
      options.each do |key, value|
        if key.to_s == "files"
          value.each do |file|
            script = labjs_format(file)
            scripts += ".script('#{script}')"
          end
        end
      end
      
      scripts += "</script>"
      scripts.html_safe
    end
    
    def labjs_format(file, dir=DEFAULT_DIR)
      unless file =~ /http:/
        file = "/#{dir}/#{file}" unless file =~ /\/?#{dir}/
        file.gsub!(/\/+/, '/')
        file = "#{file}.js" unless file =~ /\.js$/
        file = "/#{file}" unless file =~ /^\//
      end
      file
    end

  end
  
end