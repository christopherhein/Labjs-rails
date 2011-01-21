require File.join(File.dirname(__FILE__), 'labjs-rails', 'tag_helper')

ActionController::Base.helper(Labjs::TagHelper)