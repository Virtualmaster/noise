class CreateNoiseLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :noise_levels do |t|
      t.float :value

      t.timestamps
    end
  end
end
