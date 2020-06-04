class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.string :title
      t.text :description
      t.string :directer

      t.timestamps
    end
  end
end
