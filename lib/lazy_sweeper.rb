class LazySweeper < ActionController::Caching::Sweeper
  # Call the sweeper.
  def run(record)
    self.class.run
  end

  alias_method :after_save, :run
  alias_method :after_destroy, :run

  # Sweep the entire page cache destructively.
  #
  # Nothing will be removed unless the page cache directory is set to something else than the default public directory.
  def self.run
    dir = ActionController::Base.page_cache_directory
    unless dir == File.join(RAILS_ROOT, "public")
      begin
        FileUtils.rm_r(Dir["#{dir}/*"])
        RAILS_DEFAULT_LOGGER.info("Cache directory #{dir.inspect} swept.")
      rescue Errno::ENOENT
        RAILS_DEFAULT_LOGGER.info("Error sweeping cache directory #{dir.inspect}.")
      end
    end
  end
end
