require_relative "lib/central_bank_rate"
require_relative "lib/methods"

VALUTE_IDS = { 
  USD: 'R01235', 
  EUR: 'R01239', 
  AMD: 'R01060',
  CNY: 'R01375'
}.freeze

puts "Выберите валюту:"

VALUTE_IDS.keys.each.with_index(1) { |valute_name, index| puts "#{index}. #{valute_name}" }

chosen_valute_index = 0

until chosen_valute_index.between?(1, VALUTE_IDS.size)
  chosen_valute_index = $stdin.gets.to_i 
end

puts "Сколько у Вас денег в данной валюте?"
chosen_valute_sum = $stdin.gets.to_f

puts "Сколько у Вас рублей?"
rub_sum = $stdin.gets.to_f

chosen_valute = VALUTE_IDS.keys[chosen_valute_index - 1]

rate = CentralBankRate.get_rate_by_id(VALUTE_IDS[chosen_valute])

puts "\nНа данный момент #{chosen_valute} стоит #{rate} руб."

to_change = calculate_to_change(chosen_valute_sum, rub_sum, rate)

if to_change.zero?
  puts "Ваш портфель сбалансирован!"
elsif to_change.positive?
  puts "Вам нужно продать #{to_change} #{chosen_valute}."
else
  puts "Вам нужно купить #{to_change.abs} #{chosen_valute}."
end
