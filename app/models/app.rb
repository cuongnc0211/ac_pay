class App < ApplicationRecord
  STATUSES = %w[pending active inactive]

  enum :status, STATUSES.zip(STATUSES).to_h

  has_many :api_keys, dependent: :destroy
  belongs_to :user
end
