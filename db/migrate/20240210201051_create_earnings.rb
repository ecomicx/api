class CreateEarnings < ActiveRecord::Migration[7.1]
  def change
    create_table :earnings do |t|
      t.references :wallets, null: false, foreign_key: true
      t.decimal :value, precision: 10, scale: 2, default: 0.0
      t.datetime :earning_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :description, null: true
      t.integer :status, null: false, default: 0
      t.integer :kind, null: false
      t.timestamps
    end
  end
end
