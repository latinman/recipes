class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.integer :article_id, add_index: true

      t.timestamps
    end
  end
end
