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
    # ask for student's country of birth
    student_num = students.count - 1
    puts "What is #{students[student_num][:name]}'s country of birth?"
    students[student_num][:country_of_birth] = gets.chomp
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # now
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each.with_index do |student, idx|
    puts "#{idx + 1}. #{student[:name]} (#{student[:country_of_birth]}, #{student[:cohort].capitalize} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
