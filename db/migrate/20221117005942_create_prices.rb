class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.string :symbol
      t.date :date
      t.decimal :price, :precision => 32, :scale => 16

      t.timestamps
    end
  end
end
