class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.boolean :published
      t.string :created_by

      t.timestamps
    end
  end
end
