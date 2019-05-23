# let's ask the user for student names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.gsub!("\n", "")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name}
    # ask for student's cohort
    student_num = students.count - 1
    puts "What is #{students[student_num][:name]}'s cohort?"
    puts "Hit return if unknown"
    default_cohort = :unknown
    cohort = gets.gsub!("\n", "").downcase
    # assess if entered cohort is blank and if so assign it as the default
    cohort = default_cohort if cohort.empty?
    # keep asking for valid input if there's a typo
    until valid_cohort(cohort.to_sym, default_cohort) do
      puts "Please enter a valid cohort or hit return if unknown"
      cohort = gets.gsub!("\n", "").downcase
      cohort = default_cohort if cohort.empty?
    end
    students[student_num][:cohort] = cohort.to_sym
    # prints 'student' if it's the first student being entered
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.gsub!("\n", "")
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
def used_cohorts(students)
  used_cohorts = []
  students.each do |student|
    if !used_cohorts.include?(student[:cohort])
      used_cohorts << student[:cohort]
    end
  end
  used_cohorts
end
def print_header(width)
  puts "The students of Villains Academy".center(width)
  puts "-------------".center(width)
end
def print(students, width)
  used_cohorts(students).each do |cohort|
    puts "#{cohort.capitalize} cohort:".center(width)
    count = 1
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{count}. #{student[:name]}".center(width)
        count += 1
      end
    end
  end
end
def print_footer(students, width)
  # using #{students.count == 1 ? "" : "s"}  after "student" made line too long
  if students.count == 1
    puts "Overall, we have 1 great student".center(width)
  else
    puts "Overall, we have #{students.count} great students".center(width)
  end
end
#nothing happens until we call the methods
students = input_students
if students.empty?
  puts "There are no students at the Academy"
else
  line_width = 50
  print_header(line_width)
  print(students, line_width)
  print_footer(students, line_width)
end
