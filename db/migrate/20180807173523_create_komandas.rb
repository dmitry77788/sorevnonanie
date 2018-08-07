class CreateKomandas < ActiveRecord::Migration[5.1]
  def change
    create_table :komandas do |t|
      t.string :name

      t.timestamps
    end
  end
end
