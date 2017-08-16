#All students listed in an array
=begin
students = [
    {name: "Dr. Hannibal Lecter",          cohort: :november},
    {name: "Darth Vader",                  cohort: :november},
    {name: "Nurse Ratchet",                cohort: :november},
    {name: "Michael Corleone",             cohort: :november},
    {name: "Alex DeLarge",                 cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator",                   cohort: :november},
    {name: "Freddy Krueger",               cohort: :november},
    {name: "The Joker",                    cohort: :november},
    {name: "Joffrey Baratheon",            cohort: :november},
    {name: "Norman Bates",                 cohort: :november}
]
=end
#And then printed
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end
def print_students(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  
  name = gets.chomp
  
  while !name.empty? do
    #While the name variable is not empty, the following code is repeated. Breaks if nothing is entered.
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end


students = input_students  
print_header
print_students(students)
print_footer(students)