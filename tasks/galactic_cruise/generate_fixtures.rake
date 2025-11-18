require 'mini_magick'
require 'yaml'

Rake.application.options.trace_rules = true

desc 'Hello World11'
namespace :galactic_cruise do
  namespace :generate_fixtures do
    fixture_tasks = %i[
      action_tiles
      expert_tiles
      location_bonuses
      technologies
      guest_bonuses
      cruises
      company_goals
      upgrade_tokens
      gear_meeples
      guest_meeples
      cruise_mocks
    ]

    def fixture_file_list(fixture_task) = Rake::FileList.new("./sources/galactic_cruise/#{fixture_task}/**/*.webp").pathmap('%{sources/,fixtures/}p')
    fixture_tasks.each { |fixture_task| task fixture_task => fixture_file_list(fixture_task) }
    task all: fixture_tasks

    def resize_image(source:, target:, options:)
      image = MiniMagick::Image.open(source)
      image.resize(options)
      image.write(target)
    end

    # find first folder after galactic_cruise/
    def fixture_type_from_path(path) = path[%r{.*(galactic_cruise)/([a-zA-Z_]*)/?.*}, 2]
    # resize options for mini_magick
    galactic_cruise_resize_options = YAML.load_file('./configs/galactic_cruise/resize_options.yml')
    # rule for all missing .png files under fixtures/galactic_cruise/ path
    rule %r{fixtures/galactic_cruise/.+\.webp$} => ->(f) { f.pathmap('%{fixtures/,sources/}p') } do |rake_task|
      fixture_type = fixture_type_from_path(rake_task.name)
      options = galactic_cruise_resize_options[fixture_type]
      mkdir_p rake_task.name.pathmap('%d')
      resize_image(source: rake_task.source, target: rake_task.name, options:)
    end
  end
end
