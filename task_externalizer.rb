# Task Externalizer

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
puts "Congratulations!!! Good job!!!"