def calculate_to_change(valute1, valute2, rate)
  valute2_to_valute1 = (valute2 / rate).round(2)
  diff = valute1 - valute2_to_valute1

  (diff / 2).round(2)
end
