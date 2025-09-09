class ApiKey < ApplicationRecord
  before_create :generate_credentials

  belongs_to :app

  validates :title, presence: true

  private

  def generate_credentials
    self.client_id     ||= uniq_token_for(:client_id,  prefix: "cli_", hex_len: 24)
    self.client_secret ||= uniq_token_for(:client_secret, prefix: "sec_", hex_len: 64)
  end

  def uniq_token_for(column, prefix:, hex_len:)
    while true do
      candidate = prefix + SecureRandom.hex(hex_len / 2) # hex_len phải chẵn
      return candidate if !self.class.exists?(column => candidate)
    end
  end
end
