require 'mini_magick'
require 'fileutils'

desc 'Hello World1'
namespace :general do
  task cp_modules: Rake::FileList.new('/mini-karina-modules/**/*.webp')
                                 .pathmap('%{mini-karina-modules/,mini-karina/sources/}p')

  rule %r{sources/.+\.webp$} => ->(f) { f.pathmap('%{mini-karina/sources/,mini-karina-modules/}p') } do |rake_task|
    mkdir_p rake_task.name.pathmap('%d')
    FileUtils.cp rake_task.source, rake_task.name
  end
end
