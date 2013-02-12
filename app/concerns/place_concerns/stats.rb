module PlaceConcerns
  module Stats
    extend ActiveSupport::Concern

    included do
      has_many :place_views
      has_many :place_daily_views
    end

    def aggregate_daily_views_for(time)
      views = place_views.by_date(time)

      unique_visitors_ips = []
      hosts_count = 0
      hits_count = 0
      order_hits_count = 0

      views.each do |view|

        unless unique_visitors_ips.include? view.ip_address
          hosts_count += 1
          unique_visitors_ips.push view.ip_address
        end

        order_hits_count += 1 if view.order_id
        hits_count += 1

      end

      place_daily_views.create(
          date:  Time.now.yesterday.midnight.strftime('%Y-%m-%d'),
          hosts_count: hosts_count,
          hits_count: hits_count,
          order_hits_count: order_hits_count,
          order_hosts_count: 0
      )

    end

  end
end