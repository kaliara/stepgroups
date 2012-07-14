SG_DOMAIN = ENV['SG_DOMAIN']
SITE_CONFIG = YAML.load_file("#{Rails.root}/config/site_config.yml")[SG_DOMAIN]