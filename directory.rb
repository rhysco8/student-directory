@students = [] # an empty array accessible to all methods

def menu_options
  menu_options = {
    "1" => method(:input_students),
    "2" => method(:show_students),
    "3" => method(:save_students),
    "4" => method(:load_students),
    "9" => method(:exit_program)
  }
end

def input_students
  current_count = @students.count
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_to_list(name, :november)
    puts "Now we have #{student_or_students(@students.count)}"
    name = STDIN.gets.chomp
  end
  puts "Finished adding #{student_or_students(@students.count - current_count)}"
end

def student_or_students(number)
  if number == 1
    "1 student"
  else
    "#{number} students"
  end
end


def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{student_or_students(@students.count)}"
end

def ask_filename(action)
  if action == "save"
    puts "Type the name of the file to save to"
  elsif action == "load"
    puts "Type the name of the file to load from"
  end
  puts "Hit return to use students.csv"
  filename = STDIN.gets.chomp
  filename.empty? ? "students.csv" : filename
end

def save_students
  filename = ask_filename("save")
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Student list saved to #{filename}"
end

def load_students(filename = ask_filename("load"))
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_to_list(name, cohort)
  end
  file.close
  load_message(filename)
end

def load_message(filename)
  puts "Loaded #{@students.count} students from #{filename}"
end

def add_to_list(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def exit_program
  puts "Goodbye!"
  exit
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def user_choice(selection)
  if menu_options.has_key?(selection)
    menu_options[selection].()
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    user_choice(STDIN.gets.chomp)
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
