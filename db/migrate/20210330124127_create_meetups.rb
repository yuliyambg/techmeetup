class CreateMeetups < ActiveRecord::Migration[6.1]
  def change
    create_table :meetups do |t|
      t.string :title
      t.datetime :date_time
      t.string :description
      t.string :image_url
      t.string :link

      t.timestamps
    end
  end
end
