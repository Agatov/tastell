module ApplicationHelper

  # @param [Order] order
  def order_social_params(order)
    host = request.host.gsub("m.", "")
    return {
        url: "http://#{host}/places/#{order.place.id}?o=#{order.id}",
        title: CGI.escape("#{order.content}"),
        description: CGI.escape(order.place.name),
        image: "http://#{host}/#{order.place.avatar_url(:small)}"
    }
  end

  # @param [Order] order
  def vk_social_url(order)
    params = order_social_params(order)
    "http://vk.com/share.php?url=#{params[:url]}&title=#{params[:title]}&image=#{params[:image]}&description=#{params[:description]}&noparse=true"
  end

  MOBILE_BROWSERS = [
      'playbook', 'windows phone', 'android', 'ipod', 'iphone', 'opera mini', 'blackberry', 'palm','hiptop',
      'avantgo','plucker', 'xiino','blazer','elaine', 'windows ce; ppc;', 'windows ce; smartphone;',
      'windows ce; iemobile', 'up.browser','up.link','mmp','symbian','smartphone', 'midp','wap','vodafone',
      'o2','pocket','kindle', 'mobile','pda','psp','treo'
  ]

  def mobile_browser?(agent)
    agent.downcase!

    MOBILE_BROWSERS.each do |m|
      return true if agent.match(m)
    end
    false
  end
end
