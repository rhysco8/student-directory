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
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # now
  # return the array of students
  students
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
