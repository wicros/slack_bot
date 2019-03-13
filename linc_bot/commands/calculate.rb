module LincBot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base

      WDAYS = %w(sunday monday tuesday wednesday thursday friday saturday).map.with_index {|name, i| [i, name]}.to_h

      command /あと何日|还有多少天/ do |client, data, _match|
        release_day = '2018-06-06'
        days = (Date.today..Date.parse(release_day)).to_a
        business_days = days.select {|d| %w(sunday saturday).exclude? WDAYS[d.wday]}

        reply_ja = "#{release_day}まであと#{days.size}日(営業日は#{business_days.size}日)です。"
        reply_cn = "还有#{days.size}(工作日#{business_days.size})天发布〜"

        client.say(channel: data.channel, text: "#{reply_cn}\n#{reply_ja}")
      end

      command /weather|天気|天气/ do |client, data, _match|
        require 'open_weather'
        options = { units: "metric", APPID: "034a5d54985284c8b05a46f3e3b41c6b" }
        options[:lang] = "ja"
        result = OpenWeather::Current.city("Tokyo, JP", options)
        text = "天気：#{result['weather'][0]['description']}\n温度：#{result['main']['temp'].to_s}\n湿度：#{result['main']['humidity'].to_s}\n压力：#{result['main']['pressure'].to_s}"
        client.say(channel: data.channel, text: text)
      end

      command /今天吃什么？/ do |client, data, _match|
        array = %w[ 中华 越南 烤肉 寿司 拉面 汉堡 火锅 鸟贵族 炸串 そば 小笼包 粥 ]
        client.say(channel: data.channel, text: array[Random.rand(array.size-1)])
      end

      command 'debug' do |client, data, _match|
        client.say(channel: data.channel, text: 'DEBUG1')
      end

    end
  end
end
