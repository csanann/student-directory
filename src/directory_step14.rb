=begin
    1.to avoid code duplication/DRY, we have to create a new method called add_student that take the student details
and appends them to the @students array, so we can call it from both input_students and loac_students.
    2. to make the program load students.csv by default if no file is given on startup.
we need to change the try_load_students method
    3. input_students method is a long one. we can break it down into smaller methods.
print_student could be changed to print_students_list for clarity.
To make code more elegant and maintainable, we could use methods to display messages to avoid repeating the same things.
    4. To implement feedback messages for the user, we have to update the interactive_menu method.
    5. To make the script more flexible by asking for the filename if the user chooses menu items 3 and 4,
we will have to update teh interactive_menu
    6. Refactor the save_students and load_students methods to use a code block.
    7. Refactor the save_students and load_students methods to use the csv library.
    8. Write a short program that reads its own source code and print it as output.
we will use File.basename(__FILE__) method that returns the name of the currently executed file.
It will open the file in read mode, print each line, and print the source code.
    
=end
@students = []

def interactive_menu
    loop do
        #1. print the menu and ask the user what to do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "3. Save the list to student.csv"
        puts "4. Load the list from students.csv"
        puts "9. Exit" 
        #2. read the input and save it into a variable
        selection = STDIN.gets.chomp
        #3. do what the user has asked
        case selection
            when "1"
                input_students
                puts "Students input successful."
            when "2"
                show_students
            when "3"
                puts "Enter the filename to save students (e.g. students.csv): "
                filename = STDIN.gets.chomp
                save_students(filename)
                puts "Student saved to #{filename}."
            when "4"
                puts "Enter the filename to load students (e.g. students.csv): "
                filename = STDIN.gets.chomp
                load_students(filename)
                puts "Students loaded from #{filename}."
            when "9"
                puts "Exiting the program. Bye!"
                exit # terminatet he program
            else
                puts "I don't know hwat you meant, please try again."
        end
    end
end
#------------------------------------------------------
def add_student(name, cohort, student_number, email_address, phone_number,hobbies)
    @students << {name: name, cohort: cohort, student_number: student_number, email_address: email_address, phone_number: phone_number, hobbies: hobbies }
end

#------------------------------------------------------
def input_students
    puts "Please enter the names of students"
    puts "To finish, just hit return twice"
    #get the first name and store to a variable
    name = STDIN.gets.chomp
    #define the valid cohorts
    valid_cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    #while the name is not empty, repeat the code
    while !name.empty? do
        #ask for the cohort
        puts "Enter the student cohort: "
        #instore the input to a variable named cohort and convert to lowercase and symbol
        cohort_input = STDIN.gets.chomp.downcase.to_sym
        #validate the cohort input and handle typos
        until valid_cohorts.include?(cohort_input) || cohort_input.empty?
        puts "Invalid cohort. Please enter a valid cohort"
        cohort_input = STDIN.gets.chomp.downcase.to_sym
        end
        
        puts "Enter student number: "
        student_number = STDIN.gets.chomp.to_i
        
        email_address = ""
        loop do
            #loop will keep on asking the user to enter the input with @, the loop will break to the next step when has one
            puts "Enter email address: "
            email_address = STDIN.gets.chomp
            break if email_address.include?("@")
            puts "Invalid email address. Please enter a valid email address."
        end
        
        puts "Enter phone number: "
        phone_number = STDIN.gets.chomp.to_i
        puts "Enter hobbies: "
        hobbies = STDIN.gets.chomp
        
        #set a default ochort value if the cohort input is empty
        cohort_input = cohort_input.empty? ? :november : cohort_input
        #call add_student method with input values
        add_student(name, cohort_input, student_number, email_address, phone_number, hobbies)
        
        student_word = @students.count == 1 ? "student" : "students"
        puts "Now we have #{@students.count} #{student_word}"
        #get another name from the user
        puts "Please enter the name of the next student (or press enter to finish): "
        #get another name from the user
        name =  STDIN.gets.chomp
    end
end
#-------------------------------------------------
require 'csv'

def save_students(filename)
    CSV.open("data/#{filename}", "w") do |csv|
        @students.each do |student|
            student_data = [student[:name], student[:cohort], student[:student_number], student[:email_address], student[:phone_number], student[:hobbies]]
            csv << student_data
        end
    end
end
#-------------------------------------------------
def load_students(filename)
    CSV.foreach("data/#{filename}") do |row|
        name, cohort, student_number, email_address, phone_number, hobbies = line.chomp.split(',')
        add_students(name, cohort.to_sym, student_number.to_i, email_address, phone_number.to_i, hobbies)
    end
end
#--------------------------------------------------
def try_load_students
    filename = ARGV.first || "deta/students.csv"
    if File.exist?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end
#--------------------------------------------------
def print_header
    puts "The Students of Villains Academy".center(80)
    puts "------------------------------".center(80)
end
#--------------------------------------------------
def print_student
    if @students.empty?
        puts "No students to display."
    else
        @students.each_with_index do |student, index|
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohourt) - Student Number: #{student[:student_number]}, Email Address: #{student[:email_address]}, Phone Number: #{student[:phone_number]}, Hobbies: #{student[:hobbies]}".center(80)
        end
    end
end
#---------------------------------------------------
def print_grouped_by_cohort
    #group the students by cohort
    grouped_students = {}
    @students.each do |student|
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
def print_footer
    puts "Overall, we have #{@students.count} great students".center(80)
end

def show_students
    print_header
    print_grouped_by_cohort
    print_footer
end

try_load_students
interactive_menu

=begin 
8. Write a short program that reads its own source code and print it as output.
we will use File.basename(__FILE__) method that returns the name of the currently executed file.
It will open the file in read mode, print each line, and print the source code.

current_file = File.basename(__FILE__)
File.open(current_file, "r") do |file|
    file.each_line { |line| puts line }
    
>> apply to student.csv file

csv_file = "students.csv"

if File.exist?(csv_file)
    File.open(csv_file, "r") do |file|
        file.each_line { |line| puts line }
    end
else
    puts "File '#{csv_file}' not found."
end

=end