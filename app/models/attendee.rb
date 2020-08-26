class Attendee < ApplicationRecord
  belongs_to :view_party
  belongs_to :attendee, class_name: 'User'
end
