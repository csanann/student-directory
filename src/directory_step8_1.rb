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

#To print a number before the name of each student, 
#by using .each(), .each_with_index()
#output is 1. Dr. Hannibal Lecter (november cohort)
def print(students)
    students.each_with_index do |student, index|
        puts "#(index + 1). #{student[:name]} (#{students[:cohort]} cohort)"
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