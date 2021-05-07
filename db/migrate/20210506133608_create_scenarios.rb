class CreateScenarios < ActiveRecord::Migration[6.1]
  def change
    create_table :scenarios do |t|
      t.string :title
      t.string :image
      t.text :description
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
