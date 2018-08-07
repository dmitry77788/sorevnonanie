class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.date :date
      t.integer :komanda1_id
      t.integer :komanda2_id

      t.timestamps
    end
  end
end
