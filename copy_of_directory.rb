def input_students
  puts "Please enter the names, height, country of birth and cohort of the students"
  puts "To finish, hit return three times"
  #Create empty array
  students = []
  #get the first name
  name = gets.strip
  height = gets.chomp
  country = gets.chomp
  cohort = gets.chomp.to_sym
  #while the name is not empty, repeat this code
  while !name.empty? && !height.empty? && !country.empty?
    cohort = :november if cohort.empty?
    #add the student hash to the array
    students << { name: name, cohort: cohort, height: height, country_of_birth: country }
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    name = gets.chomp
    height = gets.chomp
    country = gets.chomp
    cohort = gets.chomp
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
    puts "#{i + 1}. #{students[i][:name]}, #{students[i][:height]}, #{students[i][:country_of_birth]}, (#{students[i][:cohort]})".center(20)
    i += 1
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(20)
  else
    puts "Overall, we have #{students.count} great students".center(20)
  end
end

def print_by_cohort(students)
  sorted_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = [name]
    else
      sorted_by_cohort[cohort] << name
    end
  end
  puts sorted_by_cohort
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
print(students)
print_by_cohort(students)
