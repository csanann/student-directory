#to modify the program to print only the students whose name is shorter than 12 characters
#update the print method by adding a new condition in the loop

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
    name = student[:name]
        #modify a condition in the loop for only name that has characters less than 12
        if name[0].upcase == letter.upcase && name.length < 12
            puts "#{index + 1}. #{name } (#{student[:cohort] } cohourt)"
        end
    end
end
#---------------------------------------------------^^^^
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end
#call out the methods above
students = input_students
print_header
#---------------------------------------------------
#display out only the students whose names begin with letter A
print(students, 'A')
#---------------------------------------------------^^^^
print_footer(students)