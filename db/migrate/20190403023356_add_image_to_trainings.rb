class AddImageToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :image, :string
  end
end
