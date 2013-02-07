namespace :checker do
  task check_fresh: :environment do
    orders = Order.fresh

    orders.each do |order|

    end
  end

  task check_confirmed: :environment do
    orders = Order.confirmed

    orders.each do |order|
      order.check(50)
      puts "[#{order.id}] | checked"
    end
  end

  task check_rejected: :environment do
    orders = Order.rejected

    orders.each do |order|
      order.check(100)
      puts "[#{order.id}] | checked"
    end
  end

  task check_finished: :environment do
    orders = Order.finished

    orders.each do |order|
      order.check(100)
      puts "[#{order.id}] | checked"
    end
  end
end