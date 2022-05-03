def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return three times"
  #Create empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Enter the student's height"
  height = gets.chomp
  puts "Enter student's country of birth"
  birth_country = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, height: height, country_of_birth: birth_country}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    name = gets.chomp
    height = gets.chomp
    birth_country = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
puts "----------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]}, #{students[i][:height]}, #{students[i][:birth_country]}, (#{students[i][:cohort]})"
    i += 1
  end
  # if !students.empty?
  #   students.each_with_index do |student, index|
  #     puts "#{index + 1}. #{student[:name]}, #{student[:height]}, #{student[:birth_country]} (#{student[:cohort]} cohort)"
  #   end
  # end
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
print(students)
print_footer(students)