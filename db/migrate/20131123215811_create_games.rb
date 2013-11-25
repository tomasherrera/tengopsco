class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_title
      t.string :platform
      t.string  :release_date
      t.text   :overview
      t.string :esrb
      t.string :genre
      t.string :players
      t.string :coop
      t.string :youtube
      t.string :publisher
      t.string :developer
      t.attachment :boxart

      t.timestamps
    end
  end
end
