class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :days_to_complete
      t.string :location
      t.date :start_date
      t.boolean :complete

      t.timestamps
    end
  end
end
