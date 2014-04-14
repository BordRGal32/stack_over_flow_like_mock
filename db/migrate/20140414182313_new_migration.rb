class NewMigration < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :comment
      t.belongs_to :user

     t.timestamps
   end
  end
end
