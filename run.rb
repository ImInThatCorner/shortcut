# collects arguments from command line
command, *arguments = ARGV

# gets content line by line from file
content = IO.readlines("shortcuts.txt")
# creates the key value pair hash
hashed_content = Hash.new()
# starts loop that adds to key value pair from content
content.each do
    |line|
    # separates key from value in line
    line = line.split(" ")
    # makes temporary array
    temp_array = []
    # adds to temporary array
    line.each { |x| temp_array.push(x) unless x == line[0] }
    # makes final variable
    final = temp_array * " "
    # adds to hash
    hashed_content[line[0]] = final
end

shortcut_file = File.open("shortcuts.txt","w")


# makes the first argument lowercase
command = command.to_s.downcase

# checks if there are arguments
if command.strip != ""
    # checks what the first argument is with a switch statement
    case command
    
    # WHEN COMMAND 'ADD' IS GIVEN
    when "add"
        # checks if add has valid number of arguments
        if arguments[1]
            # still checking...
            if !hashed_content.has_key?(arguments[0]) || !(["add","delete","modify","help","list"].include? arguments[0])
                # makes temporary array
                temp_array = []
                # makes new array with all values from arguments except the first one
                arguments.each { |arg| temp_array.push(arg) unless arg == arguments[0]}
                # replaces all backslashes with frontslashes
                final = temp_array * " ".to_s.gsub(/\\/, '/')
                # adds shortcut to hash
                hashed_content[arguments[0]] = final
                # sends out success message
                puts "Successfully added shortcut '#{arguments[0]}' to '#{final}'"
            else
                # sends error message if name is taken
                puts "Error: Shortcut name taken. Please choose another name." 
            end
        else
            puts "Error: Invalid number of arguments on 'add'."
        end
    # WHEN COMMAND 'DELETE' IS GIVEN
    when "delete"
        # checks if delete has valid number of arguments
        if arguments[0]
            # still checking...
            if !arguments[1]
                # checks if shortcut name exists
                if hashed_content.has_key?(arguments[0])
                    # deletes key
                    hashed_content.delete(arguments[0])
                    # sends out success message
                    puts "Successfully deleted shortcut '#{arguments[0]}'"
                else
                    # sends error message if key doesn't exist in hash
                    puts "Error: Shortcut name '#{arguments[0]}' does not exist."
                end
            else
                # sends error message if invalid number of arguments is taken
                puts "Error: Invalid number of arguments on 'delete'."
            end
        else
            # sends error message if invalid number of arguments is taken
            puts "Error: Invalid number of arguments on 'delete'."
        end
    
    # WHEN COMMAND 'MODIFY' IS GIVEN
    when 'modify'
        # checks if correct number of arguments are given
        if arguments[1]
            # checks if shortcut name already exists
            if hashed_content.has_key?(arguments[0])
                # makes temporary array
                temp_array = []
                # makes new array with all values from arguments except the first one
                arguments.each { |arg| temp_array.push(arg) unless arg == arguments[0]}
                # replaces all backslashes with frontslashes
                final = temp_array * " ".to_s.gsub(/\\/, '/')
                # modifies shortcut
                hashed_content[arguments[0]] = final
                # sends out success message
                puts "Successfully modified shortcut '#{arguments[0]}' to '#{final}'"
            else
                # sends error message if shortcut doesn't exist
                puts "Error: Shortcut name does not exist. Try command 'add' instead."
            end
        else
            # sends error message if there is an invalid number of arguments
            puts "Error: Invalid number of arguments on 'modify'." 
        end
        
    # WHEN COMMAND 'LIST' IS GIVEN
    when "list"
        # starts loop through all of hash
        hashed_content.each do
            |name, address|
            puts "'#{name}' => '#{address}'"
        end
        
    # WHEN COMMAND 'HELP' IS GIVEN
    when "help"
        # displays little command map
        puts "Add: Add a new shortcut."
        puts "  -Format: 'shortcut add [name] [address]'."
        puts "  -Example: 'shortcut add users C:/Users'"
        puts
        puts "Delete: Delete a shortcut."
        puts "  -Format: 'shortcut delete [name]'."
        puts "  -Example: 'shortcut delete users'"
        puts
        puts "Modify: Modify a shortcut's endpoint."
        puts "  -Format: 'shortcut modify [name] [address]'"
        puts "  -Example: 'shortcut modify users C:/Users/ImInThatCorner'"
        puts
        puts "List: List all shortcuts."
        puts
        puts "Help: Show this index."
    else
        # checks if command is a shortcut name
        if hashed_content.has_key?(command)
            puts hashed_content[command]
            # opens folder that shortcut is binded to
            system("cmd /c start \"\" \"#{hashed_content[command]}\"")
        else
            # sends error message if command is not a shortcut name
            puts "Error: Unknown command '#{command}'. Try command 'help' for list of commands."
        end
    end
else
    # makes sure there are arguments
    puts "Error: No arguments. Try again."
end

# puts content back in file
hashed_content.each do
    |key,value|
    shortcut_file.puts("#{key} #{value}")
end