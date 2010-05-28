class Event < ActiveRecord::Base
  validates_presence_of :name, :address, :phone, :start_time
  validates_uniqueness_of :start_time
end
