class LazySweeper < ActionController::Caching::Sweeper
  # Call the sweeper.
  def run(record)
    self.class.run
  end

  alias_method :after_save, :run
  alias_method :after_destroy, :run

  # Sweep the entire page cache.
  def self.run
    dir = ActionController::Base.page_cache_directory

    unless dir == "#{RAILS_ROOT}/public"
      FileUtils.rm_r(Dir.glob("#{dir}/*")) rescue Errno::ENOENT
      RAILS_DEFAULT_LOGGER.info("Cache directory #{dir.inspect} swept.")
    end
  end

  # Watch the supplied models.
  def self.observe(*models)
    # this method only exists for documentation purposes
    super
  end
end
