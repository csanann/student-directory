# fix the issue when we encouter the error message with singular or plural form

def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name and store to a variable
    name = gets.chomp
    #define the valid cohorts

    valid_cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    #while the name is not empty, repeat the code
    while !name.empty? do
        #ask for the cohort
        puts "Enter the student cohort: "
        #instore the input to a variable named cohort and convert to lowercase and symbol
        cohort_input = gets.chomp.downcase.to_sym
        #validate the cohort input and handle typos
        until valid_cohorts.include?(cohort_input) || cohort_input.empty?
        puts "Invalid cohort. Please enter a valid cohort"
        cohort_input = gets.chomp.downcase.to_sym
        end
        
        puts "Enter student number: "
        student_number = gets.chomp.to_i
        
        email_address = ""
        loop do
            #loop will keep on asking the user to enter the input with @, the loop will break to the next step when has one
            puts "Enter email address: "
            email_address = gets.chomp
            break if email_address.include?("@")
            puts "Invalid email address. Please enter a valie email address."
        end
        
        puts "Enter phone number: "
        phone_number = gets.chomp.to_i
        puts "Enter hobbies: "
        hobbies = gets.chomp
        
        #set a default ochort value if the cohort input is empty
        cohort_input = cohort_input.empty? ? :november : cohort_input
        #add the student details as a hash to the students array
        students << {name: name, cohort: cohort_input, student_number: student_number, email_address: email_address, phone_number: phone_number, hobbies: hobbies}
        
        student_word = students.count == 1 ? "student" : "students"
        puts "Now we have #{students.count} #{student_word}"
        #get another name from the user
        puts "Please enter the name of the next student (or press enter to finish): "
        #get another name from the user
        name =  gets.chomp
    end
    
    #return the array of students
    students
end
#--------------------------------------------------
def print_header
    puts "The Students of Villains Academy".center(80)
    puts "------------------------------".center(80)
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
            puts "#{index + 1}. #{name} (#{student[:cohort]} cohourt) - Student Number: #{student[:student_number]}, Email Address: #{student[:email_address]}, Phone Number: #{student[:phone_number]}, Hobbies: #{student[:hobbies]}".center(80)
        end
        index += 1
    end
end
#---------------------------------------------------
def print_grouped_by_cohort(students)
    #group the students by cohort
    grouped_students = {}
    students.each do |student|
        cohort = student[:cohort]
        if grouped_students[cohort]
            grouped_students[cohort] << student
        else
            grouped_students[cohort] = [student]
        end
    end
    
    #iterate through each cohort and print the students
    grouped_students.each do |cohort, student|
        puts "#{cohort.capitalize} Cohort: "
        students.each_with_index do |student, index|
            puts "#{index + 1}. #{student[:name]}"
        end
        puts "---------------------------"
    end
end
#---------------------------------------------------
def print_footer(students)
    puts "Overall, we have #{students.count} great students".center(80)
end

#call out the methods above
students = input_students
print_header
#display out only the students whose names begin with letter A
print(students, 'A')
print_grouped_by_cohort(students)
print_footer(students)