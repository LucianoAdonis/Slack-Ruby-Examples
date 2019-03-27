require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

rclient = Slack::RealTime::Client.new
wclient = Slack::Web::Client.new

message = ''
wclient.emoji_list.emoji.each do |c|
  # "icon": "https:\/\/my.slack.com\/emoji\/icon\/icon_name.png"
  message += ":#{c[0]}:"
end



rclient.web_client.chat_postMessage channel: '#yourchannel',
                                    text: message
