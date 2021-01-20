def caesar_cipher(string, key)

num_array = []
new_num_array = []
new_array = []
new_string =''
#transform string into array
  array = string.split('')
  puts 
#asign to each letter his number
  for i in (0...array.length) #ok
    num_array[i] = array[i].ord #ok
  end

#Move numbers around
#Make sure that:
#  -Only letters are replaced, so: 
#      move just numbers that are between 
#      upcase(65...90) and lowcase(97...122)
#  -If move get to the 'end' limit has to restart from 'start'
  for i in (0...num_array.length)
    if num_array[i].to_i >=97 && num_array[i] <= 122 #lowcase only
      if num_array[i].to_i + key > 122 #wrap from z to a
        new_num_array[i] = num_array[i].to_i + key -26
        new_array[i] = new_num_array[i].chr #new letters
      else #no wrap needed
        new_num_array[i] = num_array[i].to_i + key
        new_array[i] = new_num_array[i].chr #new letters
      end
    elsif num_array[i].to_i >=65 && num_array[i] <= 90 #opcase only
      if num_array[i].to_i + key > 90 #wrap from Z to A
        new_num_array[i] = num_array[i].to_i + key -26
        new_array[i] = new_num_array[i].chr #new letters
      else #no wrap needed
        new_num_array[i] = num_array[i].to_i + key
        new_array[i] = new_num_array[i].chr
      end
    else #no moving around numbers if they represent anything that is not a letter
      new_num_array[i] = num_array[i].to_i
      new_array[i] = new_num_array[i].chr
    end
  end
  new_string = new_array.join('') #getting the translated string
  return new_string
end

#Get a string
puts "write the sentence you'd like to hide!"
user_string = gets.chomp

#Get the "key"
puts "put the key"
user_key = gets.chomp.to_i

puts caesar_cipher(user_string, user_key)
