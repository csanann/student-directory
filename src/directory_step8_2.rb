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
#--------------------------------------------------
#print method that takes 'letter' parameter to filter the specific names
def print(students, letter)
    #loop iterates through the students array
    students.each_with_index do |student, index|
        #check if the first letter matches the specified letter
        if student[:name][0].upcase == letter.upcase
        puts "#{index + 1}. #{student[:name] } (#{student[:cohort] } cohourt)"
        end
    end
end
#---------------------------------------------------^^^^
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end
#call out the methods above
print_header
#---------------------------------------------------
#display out only the students whose names begin with letter A
print(students, 'A')
#---------------------------------------------------^^^^
print_footer(students)