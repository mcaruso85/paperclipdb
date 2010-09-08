# desc "Explaining what the task does"
# task :paperclipdb do
#   # Task goes here
# end
namespace :paperclipdb do
  desc "Copies migration files to db/migrate directory"
  task :setup => :environment do
    is_git_or_dir = proc {|path| path =~ /\.git/ || File.directory?(path) }
    plugin_root = File.dirname(File.dirname(File.dirname(__FILE__)))
    Dir.glob([File.join(plugin_root, "db", "migrate","*")]).reject(&is_git_or_dir).each do |file|
      path = file.sub(plugin_root, '')
      directory = File.dirname(path)
      puts "Copying #{path}..."
      FileUtils.mkdir_p(File.join(RAILS_ROOT, directory))
      FileUtils.cp(file, File.join(RAILS_ROOT, path))
    end
  end
end
