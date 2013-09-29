# -*- coding: utf-8 -*-

Plugin.create :biattack do 
  command(:biattack,
          name: 'コンボ：ふぁぼ -> リツイート',
          condition: Plugin::Command[:CanFavoriteAll] | Plugin::Command[:CanReTweetAll],
          visible: true,
          role: :timeline) do |opt|
    opt.messages.each { |m|
      if m.favoritable?
        if !m.favorited_by_me?
          m.favorite
        elsif m.retweetable? && !m.retweeted_by_me? 
          m.retweet
        end
      end
    }
 end
end
