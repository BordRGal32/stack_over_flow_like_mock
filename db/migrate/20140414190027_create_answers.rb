class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
