class Organization < ActiveRecord::Base
  self.abstract_class = true
  
  def self.connect_database(domain)
    ActiveRecord::Base.establish_connection(database(domain))
  end

  private

  def self.database(domain)
    database_name = domain.gsub(/^(www)|[^a-zA-Z0-9]/,'')
    ActiveRecord::Base.configurations[database_name]
  end
end