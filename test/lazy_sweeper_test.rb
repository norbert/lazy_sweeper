require File.dirname(__FILE__) + '/test_helper'

class LazySweeperTest < Test::Unit::TestCase
  def setup
    ActionController::Base.page_cache_directory = File.join(RAILS_ROOT, "public")
  end

  def test_should_not_remove_default_page_cache
    FileUtils.expects(:rm_r).never
    assert_nil LazySweeper.run
  end

  def test_should_remove_custom_page_cache
    ActionController::Base.page_cache_directory = File.dirname(__FILE__)
    FileUtils.expects(:rm_r).once
    assert LazySweeper.run
  end
end
