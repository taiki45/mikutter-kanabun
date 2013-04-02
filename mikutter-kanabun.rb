# -*- coding: utf-8 -*-
Plugin.create(:kanabun) do

  kanabuns = ["カナブン食べてる","最近カナブン食いまくってる気がする","気分悪いの、ずっとカナブン食べてるからかもしれん。もう食べない。","そう言えば今日はおやつにカナブン食べてしまったな","親にTwitter見られてるの忘れててツイートしてたけどカナブン食べてるのバレてしまった","カナブンを…喰ってる…！？"]

  command(
    :kanabun,
    name: "カナブンを食べる",
    condition: lambda {|_| true },
    visible: false,
    role: :window
  ) do |opt|
    Thread.new {  
      Post.primary_service.update(:message => kanabuns.sample)
    }
  end

  if UserConfig[:kanabun_filter]
    filter_update do |service, msgs|
      [
        service,
        msgs.map do |msg|
          msg[:message] = msg[:message].gsub /[ァ-ヴ]+/u, "カナブン" if msg && msg[:message].respond_to?(:gsub)
          msg
        end
      ]
    end
  end

  settings "カナブン" do
    boolean "ておくれ神と同一化したくはないか？", :kanabun_filter
  end
end
