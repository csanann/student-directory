#------------------------task 10-----------------------------
=begin

Another method that commonly used instead of .chomp() method is rstrip(). 
Both rstrip and chomp method achieve the same effectively result, for removing the trailing newline character.
.rstrip() method can more versatile when we need to remove all trailing whitespaces.
name = gets.rstrip

.chomp() method is more common used in practice for the purpose of only need to remove the newline
character and not other trailing whitespaces.
name = gets.chomp

To removes a specific suffix from the end of the string if it exist, we can use .delete_suffix() method
name = gets.delete_suffix("\n")

=end
#----------------------- task 11---------------------------------
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty do
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
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  student.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  prints "Overall, we have {names.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)