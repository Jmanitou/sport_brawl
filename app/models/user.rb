class User < ActiveRecord::Base
  has_many :events
  has_many :subscriptions
#   has_and_belongs_to_many :attended_events, class_name: 'Event'
end