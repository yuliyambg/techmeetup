class CreateMeetupsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :meetups_users do |t|
      t.integer :meetup_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
