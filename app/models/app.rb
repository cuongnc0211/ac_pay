class App < ApplicationRecord
  STATUSES = %w[pending active inactive]

  enum :status, STATUSES.zip(STATUSES).to_h
end
