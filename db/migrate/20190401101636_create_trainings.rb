class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :title
      t.text :description
      t.integer :price_per_hour
      t.string :location
      t.datetime :min_start_time
      t.datetime :max_end_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
