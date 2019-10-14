require '../lib/main.rb'

test_array_1 = [1,2,3,4,5,6]
test_array_2 = ['a','aa','aaa','b','bb','bbb']

# Test 1 my_any? output -> true
puts "Test 1: #{test_array_1.my_any?{|i| i if(i <= 3)}}"

# Test 2 my_all? output -> true
puts "Test 2: #{test_array_1.my_any?{|i| i if(i > 3)}}"

# Test 3 my_all? output -> false
puts "Test 3: #{test_array_2.my_any?(Integer)}" 

# Test 4 my_select output -> [5,6]
puts "Test 4: #{test_array_1.my_select{|i| i>4}}"

# Test 5 my_none? output -> true
# Test 6 my_none? output -> false
puts "Test 5: #{test_array_2.my_none?(Integer)}"
puts "Test 6: #{test_array_2.my_none?(String)}"

# Test 7 my_map? output -> [5,10,15,20,25,30]
puts "Test 7: #{test_array_1.my_map{|i| i*5}}"

# Test 8 my_count output -> 6
# Test 9 my_count output -> 4
puts "Test 8: #{test_array_2.my_count}"
puts "Test 9: #{test_array_1.my_count{|i| i>2}}"

# Test 10 my_inject using multiply_els output -> 720
# Test 11 my_inject output -> 21
puts "Test 10: #{test_array_1.multiply_els}"
puts "Test 11: #{test_array_1.my_inject{|i,n| i+n}}"