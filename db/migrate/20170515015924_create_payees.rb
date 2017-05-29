class CreatePayees < ActiveRecord::Migration[5.0]
  def change
    create_table :payees do |t|
      t.integer :amount
      t.references :user, foreign_key: true
      t.references :committee, foreign_key: true

      t.timestamps
    end
  end
end
