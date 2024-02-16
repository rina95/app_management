class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.datetime :start_date
      t.string :report_link

      t.timestamps
    end
  end
end
