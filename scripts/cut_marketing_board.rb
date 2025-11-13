require "mini_magick"

sources_folder_path = "/mini-karina/fixtures/galactic_cruise/sources/"

# cruises_blank
player_board_image = MiniMagick::Image.open(sources_folder_path + "marketing_board.png.webp")
player_board_image.crop("245x690+0+212")
player_board_image.write(sources_folder_path + "cruises_blank.jpg")

