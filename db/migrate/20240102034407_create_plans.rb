class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.integer :software_id, index: true
      t.string :code
      t.string :software_version
      t.string :title
      t.string :document_link
      t.string :file
      t.boolean :urgent
      t.datetime :expect_approval_date
      t.integer :app_type # enum
      t.string :app_type_text
      t.integer :request_type # enum
      t.string :contact_user
      t.integer :status # enum
      t.datetime :latest_sent_date
      t.datetime :latest_review_date
      t.datetime :sent_hd_date
      t.datetime :approval_date
      t.datetime :deadline_hd_date

      t.timestamps
    end
  end
end
