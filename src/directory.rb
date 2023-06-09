#replace from hard coding/students array to ask the user input
def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name and store to a variable
    name = gets.chomp
    #while the name is not empty, repeat the code
    while !name.empty? do
        #add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        #get another name from the user
        name =  gets.chomp
    end
    #return the array of students
    students
end

def print_header
    puts "The Students of Villains Academy"
    puts "------------------------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{students[:cohort]} cohort)"
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end
#call out the methods above
students = input_students
print_header
print(students)
print_footer(students)