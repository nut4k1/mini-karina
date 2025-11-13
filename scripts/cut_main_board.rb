require "mini_magick"

sources_folder_path = "/mini-karina/fixtures/galactic_cruise/sources/"

# deploy_bonuses_blank
player_board_image = MiniMagick::Image.open(sources_folder_path + "main_board.jpeg")
player_board_image.crop("400x535+530+1180")
player_board_image.write(sources_folder_path + "company_goals_blank.jpg")
