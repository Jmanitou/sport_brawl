class Event < ActiveRecord::Base
    belongs_to :user
    has_many :subscriptions
#   belongs_to :owner, class_name: 'User'
#   has_and_belongs_to_many :attendees, class_name: 'User'
end