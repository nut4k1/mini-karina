require "mini_magick"

sources_folder_path = "/mini-karina/fixtures/galactic_cruise/sources/"

# deploy_bonuses_blank
player_board_image = MiniMagick::Image.open(sources_folder_path + "player_board.jpg.webp")
player_board_image.crop("300x300+211+715")
player_board_image.write(sources_folder_path + "deploy_bonuses_blank.jpg")

# cruises_blank
player_board_image = MiniMagick::Image.open(sources_folder_path + "player_board.jpg.webp")
player_board_image.crop("245x690+0+212")
player_board_image.write(sources_folder_path + "cruises_blank.jpg")

