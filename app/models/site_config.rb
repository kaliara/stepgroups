class SiteConfig < ActiveRecord::Base
  default_scope where(:on => 1)
  
  def self.get(name)
    SiteConfig.find_by_name(name).try(:value).to_s
  end
end
