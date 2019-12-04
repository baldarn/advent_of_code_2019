input_min = 356261
input_max = 846303

# 6 digit
# value between the input range
# 2 adiacent number are the same
# the digits never decrese

found = (input_min..input_max).select do |number|
  number_array = number.to_s.chars.map(&:to_i)
  
  adiacents = false
  digit_doesnt_decrese = true
  number_array[1..number_array.size].inject(number_array.first) do |last_digit, d|
    digit_doesnt_decrese = false if d < last_digit
    adiacents = true if last_digit == d
    d
  end

  adiacents && digit_doesnt_decrese
end; nil

puts found.size

# step 2: at least 1 adiacent must be only size 2

found_step_2 = found.select do |number|
  number_array = number.to_s.chars.map(&:to_i)

  adiacent_only_2 = false
  adiacent_digit = nil
  adiacent_enough_found = false
  number_array[1..number_array.size].inject(number_array.first) do |last_digit, d|
    if last_digit == d
      is_series = d == adiacent_digit
      if adiacent_only_2 && is_series
        adiacent_only_2 = false
      elsif !is_series
        adiacent_digit = d
        adiacent_only_2 = true
      end
    elsif adiacent_only_2 && adiacent_digit != nil
      adiacent_enough_found = true
    end

    d
  end

  adiacent_only_2 || adiacent_enough_found
end

puts found_step_2.size

