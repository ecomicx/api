class CreateRefunds < ActiveRecord::Migration[7.1]
  def change
    create_table :refunds do |t|
      t.references :wallet, null: false, foreign_key: true
      t.decimal :value, precision: 10, scale: 2, default: 0.0
      t.datetime :refund_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :description, null: false
      t.integer :status, null: false, default: 0
      t.integer :kind, null: false, default: 0
      t.integer :refund_origin_id, null: true
      t.timestamps
    end

    add_foreign_key :refunds, :refunds, column: :refund_origin_id
  end
end
