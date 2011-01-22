module Labjs
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs LABjs"
      class_option :version, :type => :string, :default => "master", :desc => "Which version of LABjs to fetch"
      @@default_version = "master"
      @@dist_url = "https://github.com/getify/LABjs/raw/{version}/{file}"

      def remove_labjs
        %w(LAB.src.js LAB.min.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end
      end

      def download_labjs
        say_status("fetching", "LABjs (#{options.version})", :green)
        get_labjs(options.version)
      rescue OpenURI::HTTPError
        say_status("warning", "could not find LABjs (#{options.version})", :yellow)
        say_status("warning", labjs_url(options.version, 'LAB.src.js'), :yellow)
        say_status("warning", labjs_url(options.version, 'LAB.min.js'), :yellow)
        
        if @@default_version != options.version
          say_status("fetching", "LABjs (#{@@default_version})", :green)
          get_labjs(@@default_version)
        end
      end

    private

      def get_labjs(version)
        %w(LAB.src.js LAB.min.js).each do |js|
          get labjs_url(version, js), "public/javascripts/#{js}"
        end
      end
      
      def labjs_url(version, file)
        @@dist_url.gsub("{version}", version).gsub("{file}", file)
      end

    end
  end
end