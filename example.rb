require 'nokogiri'
url = "http://thegamesdb.net/api/GetPlatformGames.php?platform=12"
url_game = "http://thegamesdb.net/api/GetGame.php?id="
doc = Nokogiri::HTML(open(url))  
doc.css("id").each do |a|
  doc_game = Nokogiri::HTML(open(url_game + a.text))  
  g = Game.new
  g.id = a.text.to_i
  g.game_title = doc_game.at_css("gametitle").text
  g.platform = doc_game.at_css("platform").text
  if doc_game.at_css("releasedate").nil?
    g.release_date = ""
  else
    g.release_date = doc_game.at_css("releasedate").text
  end
  if doc_game.at_css("overview").nil?
    g.overview = ""
  else
    g.overview = doc_game.at_css("overview").text
  end
  if doc_game.at_css("esrb").nil?
    g.esrb = ""
  else
    g.esrb = doc_game.at_css("esrb").text
  end
  if doc_game.at_css("genre").nil?
    g.genre = ""
  else
    g.genre = doc_game.at_css("genre").text
  end
  if doc_game.at_css("players").nil?
    g.players = ""
  else
    g.players = doc_game.at_css("players").text
  end
  if doc_game.at_css("coop").nil?
    g.coop = ""
  else
    g.coop = doc_game.at_css("coop").text
  end
  if doc_game.at_css("youtube").nil?
    g.youtube = ""
  else
    g.youtube = doc_game.at_css("youtube").text
  end
  if doc_game.at_css("publisher").nil?
    g.publisher = ""
  else
    g.publisher = doc_game.at_css("publisher").text
  end
  if doc_game.at_css("developer").nil?
    g.developer = ""
  else
    g.developer = doc_game.at_css("developer").text
  end
  if doc_game.at_css("boxart").nil?
    g.boxart = ""
  else
    g.boxart = URI.parse("http://thegamesdb.net/banners/" +  (doc_game.at_css("boxart").text).gsub("back", "front"))
  end
  g.save
  puts g
end