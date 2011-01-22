require 'helper'
require 'generators/labjs/install/install_generator'

class Labjs::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  tests Labjs::Generators::InstallGenerator
  destination File.join(File.dirname(__FILE__), 'tmp')
  teardown :cleanup_destination_root
  
  context 'the LABjs install generator' do
    
    should 'download the default master LABjs files' do
      run_generator %w(labjs:install)
      assert_file 'public/javascripts/LAB.src.js'
      assert_file 'public/javascripts/LAB.min.js'
    end
    
    should 'download the versioned LABjs files' do
      run_generator %w(labjs:install --version master)
      assert_file 'public/javascripts/LAB.src.js'
      assert_file 'public/javascripts/LAB.min.js'
    end
    
  end
  
  private
  
  def cleanup_destination_root
    FileUtils.rm_r(destination_root)
  end

end