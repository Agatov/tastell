module ApplicationHelper

  # @param [Order] order
  def order_social_params(order)
    return {
        url: "http://#{request.host}/places/#{order.place.id}?o=#{order.id}",
        title: CGI.escape("I get 30% sale to #{order.place.name} with Gurmap"),
        description: CGI.escape("OLOLOLLO"),
        image: "http://#{request.host}/#{order.place.avatar_url(:small)}"
    }
  end

  # @param [Order] order
  def vk_social_url(order)
    params = order_social_params(order)
    "http://vk.com/share.php?url=#{params[:url]}&title=#{params[:title]}&image=#{params[:image]}&description=#{params[:description]}&noparse=true"
  end
end
