class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :comments, index: true, foreign_key: true
      t.timestamps
    end
  end
end
