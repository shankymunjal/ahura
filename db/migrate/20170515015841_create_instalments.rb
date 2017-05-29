class CreateInstalments < ActiveRecord::Migration[5.0]
  def change
    create_table :instalments do |t|
      t.string :name
      t.integer :amount
      t.references :committee, foreign_key: true

      t.timestamps
    end
  end
end
