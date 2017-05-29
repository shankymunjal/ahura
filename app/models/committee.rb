class Committee < ApplicationRecord
	has_many :instalments
	has_many :payments
	has_many :payees
	has_many :membership
	has_many :users, through: :membership
end
