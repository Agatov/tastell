class StatsGraph
  def self.generate

    g = Gruff::StackedBar.new(1200)
    g.title = "Visitors"

    stats = PlaceDailyView.order('id desc')

    g.data(I18n.translate('hosts'), stats.map {|s| s.hosts_count})
    g.data(I18n.translate('hits'), stats.map {|s| s.hits_count})
    g.data(I18n.translate('order_hits'), stats.map {|s| s.order_hits_count})

    #g.theme_37signals
    g.theme_rails_keynote

    g.bar_spacing = 0.5



    g.labels = {}
    i = 0
    stats.each do |stat|
      g.labels[i] = stat.date.strftime('%m.%d')
      i += 1
    end

    g.write Rails.root.join('public', 'graph.png')
  end
end