#All students listed in an array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratchet",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
    ]

#And then printed.q
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end
def print_students(names)
  names.each do |name|
    puts name
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

print_header
print_students(students)
print_footer(students)