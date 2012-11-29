module ApplicationHelper

  # @param [Order] order
  def order_social_params(order)
    host = request.host.gsub("m.", "")
    return {
        url: "http://#{host}/places/#{order.place.id}?o=#{order.id}",
        title: CGI.escape("#{order.place.name}"),
        description: CGI.escape(order.content),
        image: "http://#{host}/#{order.place.avatar_url(:small)}"
    }
  end

  # @param [Order] order
  def vk_social_url(order)
    params = order_social_params(order)
    "http://vk.com/share.php?url=#{params[:url]}&title=#{params[:title]}&image=#{params[:image]}&description=#{params[:description]}&noparse=true"
  end
end
