@students = [] #an empty array accessible to all methods

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
  
  name = STDIN.gets.chomp
  
  
  puts "What cohort are they part of?"
  
  cohort = STDIN.gets.chomp.to_sym
    if cohort.empty?
      cohort = "Undecided"
    end
    
  puts "What is their nationality?"
  
  nationality = STDIN.gets.chomp
  
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
  
        cohort = STDIN.gets.chomp.to_sym
          if cohort.empty?
            cohort = "Undecided"
          end
    
      puts "What is their nationality?"
  
        nationality = STDIN.gets.chomp
  
      puts "And finally, how tall are they (in centimeters)?"
  
        height = STDIN.gets.chomp
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
      else
        puts "Sorry, I don't recognise that input. Please try again"
  end
end
  
def interactive_menu
  
  loop do
    print_menu
    process(STDIN.gets.chomp)
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

def pass_to_students
  @students << {name: name, cohort: cohort.to_sym}
end


def load_students(filename = "Students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} students from #{filename}."
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

try_load_students
interactive_menu

