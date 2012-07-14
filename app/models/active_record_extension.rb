class ActiveRecordExtension < ActiveRecord::Base
  # No corresponding table in the DB.
  self.abstract_class = true
  
  # Open a connection to the appropriate database based on environment variable
  establish_connection(ActiveRecord::Base.configurations[SITE_CONFIG['database']])
end
