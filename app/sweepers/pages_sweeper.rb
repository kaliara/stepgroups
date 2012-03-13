class PagesSweeper < ActionController::Caching::Sweeper
  observe Page
  def after_update(page)
    expire_cache_for(page)
  end

  def after_destroy(page)
    expire_cache_for(page)
  end

  def after_create(page)
    expire_cache_for(page)
  end

private
  def expire_cache_for(page)
    expire_page(:controller => '/pages', :action => 'show', :slug => page.slug)
  end
end
