class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :author
      t.integer :views_count
      t.boolean :is_published
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
