require "html-proofer"

task :test do
  sh "bundle exec jekyll build"
  options = {
      :assume_extension => true,
      :http_status_ignore => [999],
      :url_ignore => [/www.carleton.ca\/1125/]
  }
  HTMLProofer.check_directory("./_site/", options).run
end
