#an array that store students information
students = [
    "DR. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex Delarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates",
    ]
#print them out    
puts "The Students of Villains Academy"
puts "------------------------------"
#replace with block of each do
students.each do |student|
    puts student
end
#finally, we print the total number of students
print "Overall, we have #{student.count} great students"