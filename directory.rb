require "csv"
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list of students from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty?
    #add the student hash to the array
    student_hash(name, :november)
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def save_students
  #Open the file for writing
  CSV.open("./#{@filename}", "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Saved #{@filename}"
end

def load_students
  puts "Enter a file to load"
  @filename = STDIN.gets.chomp
  if @filename.nil?
    @filename = "students.csv"
  end
  CSV.open("./#{@filename}", "r") do |csv|
    csv.readlines.each do |line|
      name = line[0]
      cohort = line[1]
      student_hash(name, cohort)
    end
  end
  puts "Loaded #{@filename}"
end

def student_hash(name, cohort)
  @students << { name: name, cohort: cohort.to_sym }
end

def try_load_students
  filename = ARGV.first #first argument that comes from the command line
  if filename.nil?
    load_students
    puts "Loading students.csv"
  elsif File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu
