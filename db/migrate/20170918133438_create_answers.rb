class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :text
      t.integer :question_id
      t.boolean :is_correct

      t.timestamps
    end
  end
end
