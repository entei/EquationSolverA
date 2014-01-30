CONFIG = YAML.load_file(Rails.root.join("config/config.yml"))[Rails.env]

module Sinatra
  SERVER_URL = CONFIG['url']
end