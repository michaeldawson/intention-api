class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.references :user, foreign_key: true
      t.text :what_for
      t.text :why_now
      t.text :what_else

      t.timestamps
    end
  end
end
