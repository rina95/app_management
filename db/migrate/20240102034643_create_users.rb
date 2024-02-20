class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :confluence_id
      t.integer :role
      t.string :password_digest
      t.datetime :latest_pw_updated
      
      t.timestamps

      t.index :email, unique: true
    end
  end
end
