def print_header
  puts "The students of Villains Academy".center(50, "---")
  puts "---------------".center(50)
end

def print_students(students) 
  if students.count > 0
    i = 0
      while i < students.length do
        center_me("#{students[i][:name]} is #{students[i][:nationality]}. They are #{students[i][:height]} tall and")
        center_me("part of the #{students[i][:cohort]} cohort.")
        center_me("---")
        i += 1
      end
  else
    nil
  end
end

def center_me(string)
  puts string.center(50)
end

def print_footer(students)
 students.count > 1 ?  "Overall, we have #{students.count} great students." : "We currently have #{students.count} great student."
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  @students = []
  
  name = gets.chomp
  
  
  puts "What cohort are they part of?"
  
  cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = "Undecided"
    end
    
  puts "What is their nationality?"
  
  nationality = gets.chomp
  
  puts "And finally, how tall are they (in centimeters)?"
  
  height = gets.chomp
  

  while !name.empty? do
    #While the name variable is not empty, the following code is repeated. Breaks if nothing is entered.
    @students << {name: name, cohort: cohort, nationality: nationality, height: height}
    puts "Now we have #{@students.count} students"
    puts "If necessary, enter another student's details below."
    name = gets.chomp
    if name.empty?
      @students
    else
      puts "What cohort are they part of?"
  
        cohort = gets.chomp.to_sym
          if cohort.empty?
            cohort = "Undecided"
          end
    
      puts "What is their nationality?"
  
        nationality = gets.chomp
  
      puts "And finally, how tall are they (in centimeters)?"
  
        height = gets.chomp
    end
  end  
    @students
end

def print_menu
  puts "1. input the students"
  puts "2. show the students"
  puts "3. save the list to student.csv"
  puts "4. load students from file"
  puts "9. exit"
end

def show_students
  print_header
  print_students(@students)
  print_footer(@students)
end

def process(selection)
  case selection
      when "1"
        @students = input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
  end
end
  
def interactive_menu
  
  @students = []
  
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  
  file = File.open("Students.csv", "w")
  
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("Students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

  
interactive_menu

