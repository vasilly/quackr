class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.string :status, default: 'draft'

      t.timestamps
    end
  end
end
