class AddCommitteeIdToPayees < ActiveRecord::Migration[5.0]
  def change
    add_reference :payees, :committee, index: true
  end
end
