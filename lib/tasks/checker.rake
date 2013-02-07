namespace :checker do
  task check_fresh: :environment do
    orders = Order.fresh

    orders.each do |order|

    end
  end

  task check_confirmed: :environment do
    orders = Order.order(:id)

    orders.each do |order|
      puts "[OK] | #{order.id}"
    end

  end
end