class CreateBookMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :book_meetings do |t|
      t.string :plan_code
      t.string :software_version
      t.integer :software_id, index: true
      t.string :title
      t.string :document_link
      t.string :file
      t.boolean :urgent
      t.date :expect_meeting_date
      t.integer :app_type # enum
      t.string :app_type_text
      t.integer :request_type
      t.string :contact_user
      t.integer :status
      t.string :invite_member

      t.timestamps
    end
  end
end
