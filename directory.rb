def print_header
  puts "The students of Villains Academy".center(50, "---")
  puts "---------------".center(50)
end

def print_students(students) 
  if students.count > 0
    i = 0
      while i < students.length do
        center_me("#{students[i][:name]} is #{students[i][:nationality]}. They are #{students[i][:height]} tall and they are")
        center_me("part of the #{students[i][:cohort]} cohort.")
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
  
  students = []
  
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
    students << {name: name, cohort: cohort, nationality: nationality, height: height}
    puts "Now we have #{students.count} students"
    puts "If necessary, enter another student's details below."
    name = gets.chomp
    if name.empty?
      students
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
    students
end

def interactive_menu
  
  students = []
  
  loop do
    puts "1. input the students"
    puts "2. show the students"
    puts "9. exit"
    
    selection = gets.chomp
    
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print_students(students)
        print_footer(students)
      when "9"
        exit
      end
    end
  end
  
interactive_menu

