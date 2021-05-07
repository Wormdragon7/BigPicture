class CreateScenes < ActiveRecord::Migration[6.1]
  def change
    create_table :scenes do |t|
      t.string :title
      t.string :image
      t.string :number
      t.text :description
      t.date :when
      t.references :scenario, foreign_key: true

      t.timestamps
    end
  end
end
