# -*- coding: utf-8 -*-
Plugin.create(:kanabun) do
  str=["カナブン食べてる","最近カナブン食いまくってる気がする","気分悪いの、ずっとカナブン食べてるからかもしれん。もう食べない。","そう言えば今日はおやつにカナブン食べてしまったな","親にTwitter見られてるの忘れててツイートしてたけどカナブン食べてるのバレてしまった","カナブンを…喰ってる…！？"]
  command(:kanabun,
          name: "カナブンを食べる",
          condition: lambda{|opt| true},
          visible: false,
          role: :window ) do |opt|
    Thread.new {  
      Post.primary_service.update(:message => str[rand(str.size)])
    }
  end
end
