require 'helper'

class TestTagHelper < Test::Unit::TestCase

  def setup
    @controller = SomeController.new
  end
  
  should "return initalize LABjs" do
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_load("/javascripts/labjs.js")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_load("labjs.js")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_load("javascripts/labjs.js")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_load("javascripts/labjs")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_load("labjs")
  end

  should "return valid script labjs tags" do
    assert_equal "<script type=\"text/javascript\">$LAB.script('/javascripts/jquery.min.js').wait()</script>", @controller.labjs_include_tag(:require => ["jquery.min"])
    assert_equal "<script type=\"text/javascript\">$LAB.script('/javascripts/jquery.min.js').wait().script('/javascripts/jquery.ui.js').script('/javascripts/jquery.cookie.js')</script>", @controller.labjs_include_tag(:files => ['jquery.ui', 'jquery.cookie'], :require => ['jquery.min'])
    assert_equal "<script type=\"text/javascript\">$LAB.script('/javascripts/jquery.min.js').wait().script('/javascripts/jquery.ui.js').wait().script('/javascripts/jquery.cookie.js')</script>", @controller.labjs_include_tag(:files => ['jquery.cookie'], :require => ['jquery.min', 'jquery.ui'])
  end


end
