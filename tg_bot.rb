require 'yaml'
require 'telegram/bot'
require './services/galactic_cruise/compositors'
require './services/galactic_cruise/builders/context_builder'

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength

token = YAML.load_file('secrets.yml')['tg_bot']['token']

def actions(context)
  GalacticCruise::Compositors::ActionTileCompositor.call(context:)
  GalacticCruise::Compositors::ExpertTileCompositor.call(context:)
  GalacticCruise::Compositors::LocationBonusCompositor.call(context:)
  GalacticCruise::Compositors::ActionGearCompositor.call(context:)
  path = './tmp/action_board_image.png'
  context.action_board_image.write path
  path
end

def techno(context)
  GalacticCruise::Compositors::TechnologyCompositor.call(context:)
  GalacticCruise::Compositors::TechnologyGearCompositor.call(context:)
  path = './tmp/technology_board_image.png'
  context.technology_board_image.write path
  path
end

def upgrade_token(context)
  GalacticCruise::Compositors::UpgradeTokenCompositor.call(context:)
  path = './tmp/upgrade_token_board_image.png'
  context.upgrade_token_board_image.write path
  path
end

def guest_bonus(context)
  GalacticCruise::Compositors::GuestBonusCompositor.call(context:)
  path = './tmp/guest_bonus_board_image.png'
  context.guest_bonus_board_image.write path
  path
end

def company_goal(context)
  GalacticCruise::Compositors::CompanyGoalCompositor.call(context:)
  path = './tmp/company_goal_board_image.png'
  context.company_goal_board_image.write path
  path
end

def marketing(context)
  GalacticCruise::Compositors::CruiseCompositor.call(context:)
  GalacticCruise::Compositors::GuestCompositor.call(context:)
  path = './tmp/marketing_board_image.png'
  context.marketing_board_image.write path
  path
end

def make_boards(bot, context, message)
  # send actions board
  path = actions(context)
  path_to_photo = File.expand_path(path)
  bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(path_to_photo, 'image/png'))

  # send technology board
  path = techno(context)
  path_to_photo = File.expand_path(path)
  bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(path_to_photo, 'image/png'))

  # send upgrade token board
  path = upgrade_token(context)
  path_to_photo = File.expand_path(path)
  bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(path_to_photo, 'image/png'))

  # send guest bonus board
  path = guest_bonus(context)
  path_to_photo = File.expand_path(path)
  bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(path_to_photo, 'image/png'))

  # send company goal board
  path = company_goal(context)
  path_to_photo = File.expand_path(path)
  bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(path_to_photo, 'image/png'))

  # send marketing board
  path = marketing(context)
  path_to_photo = File.expand_path(path)
  bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(path_to_photo, 'image/png'))
end

puts 'Try to start bot with provided token!'
Telegram::Bot::Client.run(token) do |bot|
  puts 'Bot started successfully with long polling strategy!'

  bot.listen do |message|
    puts message.inspect
    puts "New message from #{message.from.first_name}: #{message.text}"

    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Привет, #{message.from.first_name}")

      question = 'Давай сгенерируем поле для Галактического Криуза?'
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: [
            [{ text: 'Базовое' }, { text: 'Прогресс' }],
            [{ text: 'Комфорт' }, { text: 'Нет, спасибо' }]
          ],
          one_time_keyboard: true
        )
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Пока, #{message.from.first_name}")
    when 'Базовое'
      bot.api.send_message(chat_id: message.chat.id, text: 'Начинаю генерацию базового поля...')

      context = GalacticCruise::Builders::ContextBuilder.call(
        game_mode: :base,
        players_count: 3
      )

      make_boards(bot, context, message)
      bot.api.send_message(chat_id: message.chat.id, text: 'Готово! Все поля сгенерированы и отправлены.')
    when 'Прогресс'
      bot.api.send_message(chat_id: message.chat.id, text: 'Начинаю генерацию поля для дополнения Прогресс...')

      context = GalacticCruise::Builders::ContextBuilder.call(
        game_mode: :advancement,
        players_count: 3
      )

      make_boards(bot, context, message)
      bot.api.send_message(chat_id: message.chat.id, text: 'Готово! Все поля сгенерированы и отправлены.')
    when 'Комфорт'
      bot.api.send_message(chat_id: message.chat.id, text: 'Начинаю генерацию поля для дополнения Комфорт...')

      context = GalacticCruise::Builders::ContextBuilder.call(
        game_mode: :accommodation,
        players_count: 3
      )

      make_boards(bot, context, message)
      bot.api.send_message(chat_id: message.chat.id, text: 'Готово! Все поля сгенерированы и отправлены.')
    else
      puts "Error: Unknown command received: #{message.text}"
      bot.api.send_message(chat_id: message.chat.id, text: "Я не понимаю команду: #{message.text}")

      question = 'Давай сгенерируем поле для Галактического Криуза?'
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: [
            [{ text: 'Базовое' }, { text: 'Прогресс' }],
            [{ text: 'Комфорт' }, { text: 'Нет, спасибо' }]
          ],
          one_time_keyboard: true
        )
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/BlockLength
