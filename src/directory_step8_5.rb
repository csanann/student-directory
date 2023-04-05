#Add more students' information
#update the input_student method to request addtitional details from the user 
#and store them in the students array
def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name and store to a variable
    name = gets.chomp
    #while the name is not empty, repeat the code
    while !name.empty? do
        puts "Enter the cohort: "
        cohort = gets.chomp
        puts "Enter student number: "
        student_number = gets.chomp.to_i
        email_address = ""
        loop do
            puts "Enter email address: "
            email_address = gets.chomp
            break if email_address.include?("@")
            puts "Invalid email address. Please enter a valie email address."
        end
        
        puts "Enter phone number: "
        phone_number = gets.chomp.to_i
        puts "Enter hobbies: "
        hobbies = gets.chomp
        
        #add the student details as a hash to the students array
        students << {name: name, cohort: cohort, student_number: student_number, email_address: email_address, phone_number: phone_number, hobbies: hobbies}
        
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
    #set initial index to 0
    index = 0
    while index < students.length
        student = students[index]
        name = student[:name]
        #modify a condition in the loop for only name that has characters less than 12
        if name[0].upcase == letter.upcase && name.length < 12
            puts "#{index + 1}. #{name} (#{student[:cohort]} cohourt) - Student Number: #{student[:student_number]}, Email Address: #{student[:email_address]}, Phone Number: #{student[:phone_number]}, Hobbies: #{student[:hobbies]}"
        end
        index += 1
    end
end
#---------------------------------------------------^^^^
def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

#call out the methods above
students = input_students
print_header
#display out only the students whose names begin with letter A
print(students, 'A')
print_footer(students)