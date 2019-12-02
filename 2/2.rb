input = [
  # add input here
]

def the_game(input, noun, verb)

  cloned_input = input.clone
  cloned_input[1] = noun
  cloned_input[2] = verb

  cloned_input.each_slice(4) do |operation|
    op = operation[0]
    first_idx = operation[1]
    second_idx = operation[2]
    result_idx = operation[3]

    # decide operation

    if op == 1
      # sum
      cloned_input[result_idx] = cloned_input[first_idx] + cloned_input[second_idx]
    end

    if op == 2
      # moltiplication
      cloned_input[result_idx] = cloned_input[first_idx] * cloned_input[second_idx]
    end

    if op == 99
      break
    end

  end

  cloned_input
end

# result first stage
output = the_game(input, 12, 2)
puts output[0]

# result second stage

# brute force beause is the first thing...
(0..99).each do |verb|
  (0..99).each do |noun|
    output = the_game(input, noun, verb)
    if output[0] == 19690720
      puts "found verb #{verb} noun #{noun}"
      break
    end
  end
end

puts 'gg'
