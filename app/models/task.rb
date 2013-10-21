require "squeel"

class Task < ActiveRecord::Base
  belongs_to :user

  scope :ascending, -> { order{created_at.asc} }
end
