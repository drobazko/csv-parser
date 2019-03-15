puts 'creating weeks...'
%w[
  2018-12-03/2018-12-09
  2018-12-10/2018-12-16
  2018-12-17/2018-12-23
  2018-12-24/2018-12-30
].each do |week_range|
  week_start, week_end = week_range.split('/')
  Week.create(week_start: week_start, week_end: week_end)
end

puts 'creating coffeeshops...'
{
  'Coffeeshop A' => {
    identifier: 'Location1'
  },
  'Coffeeshop B' => {
    identifier: 'Location2'
  }
}.each_pair do |name, config|
  Coffeeshop.create!(identifier: config[:identifier], name: name)
end

shop_a = Coffeeshop.find_by_name('Coffeeshop A')
shop_b = Coffeeshop.find_by_name('Coffeeshop B')

puts 'creating coffees...'
{
  'Espresso'    => [{ coffeeshop: shop_a, identifier: 'C01' }, { coffeeshop: shop_b, identifier: 'ESP' }],
  'Cappuccino'  => [{ coffeeshop: shop_a, identifier: 'C02' }, { coffeeshop: shop_b, identifier: 'CAP' }],
  'Flat White'  => [{ coffeeshop: shop_a, identifier: 'C03' }, { coffeeshop: shop_b, identifier: 'FTW' }],
  'Americano'   => [{ coffeeshop: shop_a, identifier: 'C04' }, { coffeeshop: shop_b, identifier: 'AME' }],
  'Caffé Mocha' => [{ coffeeshop: shop_a, identifier: 'C05' }, { coffeeshop: shop_b, identifier: 'CMO' }]
}.each do |name, codes|
  coffee = Coffee.create(name: name)
  codes.each { |attrs| coffee.coffeeshop_coffees.create!(attrs) }
end

puts 'done.'
