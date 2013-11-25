class Game < ActiveRecord::Base
  attr_accessible :id, :game_title, :platform, :release_date, :overview, :esrb, 
  :genre, :players, :coop, :youtube, :publisher,:developer, :boxart

  has_attached_file :boxart,
    :styles => { :medium => "600x600>", :thumb => "200x200>" },
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    #:path => "games/images/:id_:game_title/:style/:boxart_file_name"
    :dropbox_options => {
      :path => proc { |style| "games/images/#{id}/#{style}/#{boxart_file_name}" }
    }

  #validates_attachment_presence :boxart
  #validates_attachment_size :boxart, :less_than => 5.megabytes
  #validates_attachment_content_type :boxart, :content_type => ['image/jpeg', 'image/png']
end
