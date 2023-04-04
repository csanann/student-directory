#an array that store students information
students = [
    {name: "DR. Hannibal Lecter",cohort: :november},
    {name: "Darth Vader", cohort: :november },
    {name: "Nurse Ratched", cohort:  :november },
    {name: "Michael Corleone", cohort: :november },
    {name: "Alex Delarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november },
    {name: "Terminator", cohort: :november },
    {name: "Freddy Krueger", cohort: :november },
    {name: "The Joker", cohort: :november },
    {name: "Joffrey Baratheon", cohort: :november },
    {name: "Norman Bates", cohort: :november }
    ]
def print_header
    puts "The Students of Villains Academy"
    puts "------------------------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{students[:cohort]} cohort)"
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end
#call out the methods above
print_header
print(students)
print_footer(students)