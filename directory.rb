#All students listed in an array
students = [
    ["Dr. Hannibal Lecter", :november],
    ["Darth Vader", :november],
    ["Nurse Ratchet", :november],
    ["Michael Corleone", :november],
    ["Alex DeLarge", :november],
    ["The Wicked Witch of the West", :november],
    ["Terminator", :november],
    ["Freddy Krueger", :november],
    ["The Joker", :november],
    ["Joffrey Baratheon",:november],
    ["Norman Bates", :november]
    ]

#And then printed.q
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end
def print_students(students)
  students.each do |student|
    puts "#{student[0]} (#{student[1]} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

print_header
print_students(students)
print_footer(students)