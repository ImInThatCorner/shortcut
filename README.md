# shortcut
This is a small project I made since I was tired of having to go through multiple folders to open a file repeatedly. In this project, you can set a shortcut to a folder, and when you want to access that folder, you can just write the shortcut's name and the folder will automatically open for you (Only compatible with Windows for now).

## installation
1. Download this repo's files
2. Install Ruby if you dont't have it already from https://www.ruby-lang.org/en/
3. Set a path variable to the folder where you kept these files (here is a good tutorial if you don't know how: http://www.computerhope.com/issues/ch000549.htm)
4. Rest of steps explained in section 'usage'

## usage
In order to use this program, you will first have to open your command prompt or any other terminal.
If you have decided you'd rather not set a path variable, you will have to change directories (CD) into the folder where you kept these files.
In your terminal, type "shortcut help" for the set of commands you can use.

## commands

####1. [shortcut]
Open file or folder connected to shortcut.

####2. Add
Add a new shortcut.
Format: 'shortcut add [name] [address]'. Example: 'shortcut add users C:/Users'.

####3. Modify
Modify a shortcut
Format: 'shortcut modify [name] [address]'. Example: 'shortcut modify users C:/Users/ImInThatCorner'.

####4. Delete 
Delete a shortcut
Format: 'shortcut delete [name]'. Example: 'shortcut delete users'.

####5. List
List all shortcuts.

####6. Help
Show this index.
