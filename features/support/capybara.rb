require "capybara"
require "capybara/poltergeist"

Capybara.javascript_driver = :poltergeist

Capybara.add_selector :record do
  xpath { |record| XPath.css("#" + ActionView::RecordIdentifier.dom_id(record)) }
  match { |record| record.is_a?(ActiveRecord::Base) }
end

Before("@javascript") do
  server = Capybara.current_session.server
  host! "#{server.host}:#{server.port}"
end
