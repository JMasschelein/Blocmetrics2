class Event < ApplicationRecord
    has_many :applications, dependent: :destroy
end
