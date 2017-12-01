require "html-proofer"

task :test do
  sh "bundle exec jekyll build"
  HTMLProofer.check_directory("./_site/", http_status_ignore: [999]).run
end
