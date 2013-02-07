class VkChecker

  attr_accessor :order, :success, :vk

  attr_accessor :likes_count, :reposts_count, :comments_count

  # @param [Order] order
  def initialize(unchecked_order)

    self.order = unchecked_order

    self.success = false

    self.vk = VkontakteApi::Client.new(order.user.authentication.token)
    self.vk.users.get(uid: order.user.authentication.uid)
  end

  def get_wall_posts(count = 20)
    posts = vk.wall.get(count: count)

    # Удаляем количество сообщений на стене
    posts.delete_if {|p| p.is_a? Integer}
    posts
  end

  def check
    get_wall_posts.each do |post|
      next unless post.attachment and post.attachment["type"] == 'link'
      break if check_one(post).success?
    end
    self
  end

  def check_one(post)
    if post.attachment["link"]["url"].include? expected_url
      self.success = true

      self.likes_count = post.likes['count']
      self.reposts_count = post.reposts['count']
      self.comments = post.comments['count']
    end

    self
  end

  def success?
    success
  end

  def expected_url
    "tastle.ru/places/#{order.place_id}?o=#{order.id}"
  end

end