class RemoveTimesFromTrainings < ActiveRecord::Migration[5.2]
  def change
    remove_column :trainings, :min_start_time, :datetime
    remove_column :trainings, :max_end_time, :datetime
  end
end
