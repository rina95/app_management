class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :comment
      t.string :user_id

      t.timestamps

      t.index [:commentable_type, :commentable_id], name: "index_comments_on_commentable"
    end
  end
end
