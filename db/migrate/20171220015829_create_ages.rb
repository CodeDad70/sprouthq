class CreateAges < ActiveRecord::Migration[5.1]
  def change
    create_table :ages do |t|
    	t.integer :months
    	t.integer :years

      t.timestamps
    end
  end
end