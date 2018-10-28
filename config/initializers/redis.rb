if Rails.env.production?
  puts "production: #{ENV['REDIS_URL']}"
  uri = URI.parse(ENV["REDIS_URL"])
else
  puts "not production"
  uri = URI.parse("redis://localhost:6379")
end
