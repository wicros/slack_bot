module LincBot
  module Commands
    class Greeting < SlackRubyBot::Commands::Base
      command 'こんにちは' do |client, data, _match|
        client.say(channel: data.channel, text: '您好')
      end

      command '您好' do |client, data, _match|
        client.say(channel: data.channel, text: 'こんにちは')
      end

      command 'hello' do |client, data, _match|
        client.say(channel: data.channel, text: 'hello')
      end

      command '王超' do |client, data, _match|
        client.say(channel: data.channel, text: '浩克')
      end
    end
  end
end
