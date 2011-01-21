require 'helper'

class TestTagHelper < Test::Unit::TestCase

  def setup
    @controller = SomeController.new
  end
  
  should "return initalize LABjs" do
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_init("/javascripts/labjs.js")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_init("labjs.js")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_init("javascripts/labjs.js")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_init("javascripts/labjs")
    assert_equal "<script type=\"text/javascript\" src=\"/javascripts/labjs.js\"></script>", @controller.labjs_init("labjs")
  end

  should "return valid script tag" do
    assert_equal "<script type=\"text/javascript\">$LAB.script('/javascripts/jquery.js').wait()</script>", @controller.labjs_include_tag('jquery')
    assert_equal "<script type=\"text/javascript\">$LAB.script('/javascripts/jquery.js').wait().script('/javascripts/jquery.ui.js').script('/javascripts/jquery.cookie.js')</script>", @controller.labjs_include_tag('jquery', ['jquery.ui', 'jquery.cookie']),
  end

end
