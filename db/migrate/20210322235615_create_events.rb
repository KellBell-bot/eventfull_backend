class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :link
      t.date :date_field
      t.boolean :fee

      t.timestamps
    end
  end
end
