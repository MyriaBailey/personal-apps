# Task Externalizer
# Sometimes, you need a bit of extra help externalizing what all needs to be done and in what order.
# This very short program was written to help sort that in a simple interactive app.

def new_task(task)
  loop do
    puts "What do you need to do in order to #{task}?"
    input = gets.chomp
    if input == "nothing" || input == "done" || input == "next"
      break
    else
      new_task(input)
    end
  end
end


puts "What do you want to get done?"
new_task(gets.chomp)
puts "Congratulations!!! Good job!!"