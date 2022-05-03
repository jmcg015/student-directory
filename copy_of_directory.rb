def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  #Create empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
puts "----------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

def first_letter(students)
  students.each do |student|
    if student[:name].chars.first.downcase == "d"
      puts student[:name]
    end
  end
end

def shorter_than(students)
  students.each do |student|
    if student[:name].length <= 12
      puts "#{student[:name]} is shorter than 12 character"
    end
  end
end

students = input_students
print_header
shorter_than(students)
print_footer(students)