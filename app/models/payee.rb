class Payee < ApplicationRecord
  belongs_to :user
  belongs_to :committee
end
