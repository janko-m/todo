require "active_attr"

class Session
  include ActiveAttr::Model

  attribute :username, type: String
  attribute :password, type: String
end
