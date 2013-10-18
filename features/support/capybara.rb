require "capybara"
require "capybara/poltergeist"

Capybara.javascript_driver = :poltergeist

Before("@javascript") do
  server = Capybara.current_session.server
  host! "#{server.host}:#{server.port}"
end
