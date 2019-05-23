# let's ask the user for student names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name}
    # ask for student's cohort
    student_num = students.count - 1
    puts "What is #{students[student_num][:name]}'s cohort?"
    puts "Hit return if unknown"
    default_cohort = :unknown
    cohort = gets.chomp.downcase
    # assess if entered cohort is blank and if so assign it as the default
    cohort = default_cohort if cohort.empty?
    # keep asking for valid input if there's a typo
    until valid_cohort(cohort.to_sym, default_cohort) do
      puts "Please enter a valid cohort or hit return if unknown"
      cohort = gets.chomp.downcase
      cohort = default_cohort if cohort.empty?
    end
    students[student_num][:cohort] = cohort.to_sym
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
#checks for valid cohort input
def valid_cohort(cohort, default)
  cohorts = [
    :january, :february, :march, :april,
    :may, :june, :july, :august,
    :september, :october, :november, :december,
    default.to_sym
  ]
  cohorts.include?(cohort.to_sym)
end
def print_header(width)
  puts "The students of Villains Academy".center(width)
  puts "-------------".center(width)
end
def print(students, width)
  students.each.with_index do |student, idx|
    puts "#{idx + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)".center(width)
  end
end
def print_footer(students, width)
  puts "Overall, we have #{students.count} great students".center(width)
end
#nothing happens until we call the methods
students = input_students
line_width = 50
print_header(line_width)
print(students, line_width)
print_footer(students, line_width)
