require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new

client.users_list.members.each do |c|
  p "Name: #{c.name}, Email: #{c.profile.email}"
  # You can also check if the users are available with something like this:
  #
  # if c.deleted == false
  #   "Name: #{c.name}, Email: #{c.profile.email}"
  # end
end
