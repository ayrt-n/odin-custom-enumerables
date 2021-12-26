require_relative 'custom_enumberables.rb'

## COMPARISONS TO ORIGINAL METHODS ##

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
hash = { a: 1, b: 2, c: 3, d: 4}

puts '#my_each:'
numbers.my_each  { |item| puts item }
(5..10).my_each { |num| puts num + 2 }
['a', 'b', 'c'].my_each { |word| puts word }
puts numbers.my_each
hash.my_each { |key, val| puts "#{key}: #{val}" }
puts '#each:'
numbers.each  { |item| puts item }
(5..10).each { |num| puts num + 2 }
['a', 'b', 'c'].each { |word| puts word }
puts numbers.each
hash.each { |key, val| puts "#{key}: #{val}" }
puts ''

puts '#my_each_with_index:'
numbers.my_each_with_index { |val, idx| puts "Index #{idx}: #{val}" }
(5..10).my_each_with_index { |val, idx| puts "Index #{idx}: #{val}" }
['a', 'b', 'c'].my_each_with_index { |val, idx| puts "Index #{idx}: #{val}" }
hash.my_each_with_index { |(key, val), idx| puts "#{key}: #{val} (idx: #{idx})" }
puts '#each_with_index:'
numbers.each_with_index { |val, idx| puts "Index #{idx}: #{val}" }
(5..10).each_with_index { |val, idx| puts "Index #{idx}: #{val}" }
['a', 'b', 'c'].each_with_index { |val, idx| puts "Index #{idx}: #{val}" }
hash.each_with_index { |(key, val), idx| puts "#{key}: #{val} (idx: #{idx})" }
puts ''

puts '#my_select:'
puts numbers.my_select { |num| num.even? }
puts (90..100).my_select { |num| num % 3 == 0 }
p hash.my_select { |key, val| val.even? }
puts '#select:'
puts numbers.select { |num| num.even? }
puts (90..100).select { |num| num % 3 == 0 }
p hash.select { |key, val| val.even? }
puts ''

puts '#my_all?:'
puts [].my_all?
puts [true, true].my_all?
puts [true, false].my_all?
puts numbers.my_all? { |num| num % 1 == 0 }
puts (0..10).my_all? { |num| num % 3 == 0 }
puts %w[abc, def, ghi].my_all? { |word| word.length == 3 }
puts hash.my_all? { |key, val| val > 0 }
puts hash.my_all? { |key, val| val > 3 }
puts '#all?:'
puts [].all?
puts [true, true].all?
puts [true, false].all?
puts numbers.all? { |num| num % 1 == 0 }
puts (0..10).all? { |num| num % 3 == 0 }
puts %w[abc, def, ghi].all? { |word| word.length == 3 }
puts hash.all? { |key, val| val > 0 }
puts hash.all? { |key, val| val > 3 }
puts ''

puts '#my_any?:'
puts [].my_any?
puts [true, false].my_any?
puts numbers.my_any? { |num| num % 3 == 0 }
puts (0..10).my_any? { |num| num % 3 == 10 }
puts %w[abc, def, ghij].my_any? { |word| word.length == 4 }
puts hash.my_any? { |key, val| val > 3 }
puts hash.my_any? { |key, val| val > 5 }
puts '#any?:'
puts [].any?
puts [true, false].any?
puts numbers.any? { |num| num % 3 == 0 }
puts (0..10).any? { |num| num % 3 == 10 }
puts %w[abc, def, ghij].any? { |word| word.length == 4 }
puts hash.any? { |key, val| val > 3 }
puts hash.any? { |key, val| val > 5 }
puts ''

puts '#my_none?'
puts [].my_none?
puts [true, false].my_none?
puts numbers.my_none? { |num| num % 3 == 0 }
puts (0..10).my_none? { |num| num % 3 == 10 }
puts %w[abc, def].my_none? { |word| word.length > 3 }
puts hash.my_none? { |key, val| val > 3 }
puts hash.my_none? { |key, val| val > 5 }
puts '#none?:'
puts [].none?
puts [true, false].none?
puts numbers.none? { |num| num % 3 == 0 }
puts (0..10).none? { |num| num % 3 == 10 }
puts %w[abc, def].none? { |word| word.length > 3 }
puts hash.none? { |key, val| val > 3 }
puts hash.none? { |key, val| val > 5 }
puts ''

puts '#my_count:'
puts numbers.my_count
puts (1..10).my_count { |num| num.even? }
puts ['abc', 'defg', 'hij'].my_count { |words| words.length == 3 }
puts hash.my_count { |key, val| val > 2 }
puts hash.my_count
puts '#count:'
puts numbers.count
puts (1..10).count { |num| num.even? }
puts ['abc', 'defg', 'hij'].count { |words| words.length == 3 }
puts hash.count { |key, val| val > 2 }
puts hash.count
puts ''

puts '#my_map:'
puts numbers.my_map { |num| num * num }
puts (1..4).my_map { "cat" }
p hash.my_map { |key, val| val * 2 }
p hash.my_map { |key, val| key.to_s + 's' }
puts '#map:'
puts numbers.map { |num| num * num }
puts (1..4).map { "cat" }
p hash.map { |key, val| val * 2 }
p hash.map { |key, val| key.to_s + 's' }
puts ''

puts '#my_map_w_proc:'
square = Proc.new { |num| num * num }
hash_square = Proc.new { |key, val| val * val }
cat = Proc.new { "cat" }
puts numbers.my_map_w_proc(square)
puts (1..4).my_map_w_proc(cat)
puts hash.my_map_w_proc(hash_square)
puts '#map:'
puts numbers.map { |num| num * num }
puts (1..4).map { "cat" }
puts hash.map { |key, val| val * val }
puts ''

puts '#my_map_w_proc_or_block:'
square = Proc.new { |num| num * num }
cat = Proc.new { "cat" }
puts numbers.my_map_w_proc_or_block(square)
puts numbers.my_map_w_proc_or_block { |num| num * num }
puts numbers.my_map_w_proc_or_block(square) { |num| num }
puts (1..4).my_map_w_proc_or_block(cat)
puts (1..4).my_map_w_proc_or_block { "cat" }
puts '#map:'
puts numbers.map { |num| num * num }
puts (1..4).map { "cat" }
puts ''

puts '#my_inject:'
puts (5..10).my_inject(&:+)
puts (5..10).my_inject { |sum, n| sum + n }
puts (5..10).my_inject(1, &:*)
puts (5..10).my_inject(1) { |product, n| product * n }
longest = %w{ cat sheep bear }.my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest
puts hash.my_inject(0) { |sum, (key, val)| sum + val }
puts '#inject:'
puts (5..10).inject(&:+)
puts (5..10).inject { |sum, n| sum + n }
puts (5..10).inject(1, &:*)
puts (5..10).inject(1) { |product, n| product * n }
longest = %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest
puts hash.inject(0) { |sum, (key, val)| sum + val }
puts ''

# Test #my_inject with method called #multiply_els 
# which multiplies all the elements of the array together 
# by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
puts 'Use of inject within method'
def multiply_els(arr)
  arr.my_inject(&:*)
end
puts multiply_els([2, 4, 5])
