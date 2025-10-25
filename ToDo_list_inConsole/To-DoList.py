x="y"
ToDo = open ("To-DoList.txt" ,"r")
count = ToDo.read()
count = count.split("\n")
i = len(count)
while(x.lower() == "y"):
    print("""
          1. Add task
          2. Show tasks
          3. Delete task
          4. Edit task""")
    choice = int(input("What's ur choice from 4 :"))
    
    if (choice == 1):
        ToDo = open ("To-DoList.txt" ,"a")
        y = input ("Enter ur task :")
        i += 1
        ToDo.write("\n" + str(i)+". " + y)
    elif (choice == 2):
        ToDo = open ("To-DoList.txt" ,"r")
        mylist = ToDo.read()
        print (mylist)
        
    elif (choice == 3):
        ToDo = open ("To-DoList.txt" ,"r")
        file = ToDo.read()
        print(file)
        myarray = file.split("\n")
        choiceDel = int(input (f"What do u want to delete from the {len(myarray)} choices : "))
        myarray.pop(choiceDel-1)
        
        while (choiceDel <= len(myarray)):
            edit = myarray[choiceDel -1].split(" ")
            edit[0] = str(choiceDel) + "."
            edittask = " ".join(edit)
            myarray[choiceDel -1] = edittask
            choiceDel+=1
        ToDo = open ("To-DoList.txt" ,"w")

        ToDo = open ("To-DoList.txt" ,"a")
        ii=0
        while(ii <= len(myarray) -1):
            if (ii < len(myarray)-1):
                ToDo.write(myarray[ii] + "\n")
            elif (ii == len(myarray)-1):
                ToDo.write(myarray[ii])
            ii+=1
        ToDo = open ("To-DoList.txt" ,"r")
        file = ToDo.read()
        print(file)
    elif (choice == 4):
        ToDo = open ("To-DoList.txt" ,"r")
        file = ToDo.read()
        print(file)
        myarray = file.split("\n")
        choiceDel = int(input (f"What's task do u want to edit from the {len(myarray)} choices"))
        edittask = input ("enter the edit task: ")
        myarray[choiceDel -1] = str(choiceDel) + ". " + edittask
        ToDo = open ("To-DoList.txt" ,"w")
        
        ToDo = open ("To-DoList.txt" ,"a")
        ii=0
        while(ii <= len(myarray) -1):
            if (ii < len(myarray)-1):
                ToDo.write(myarray[ii] + "\n")
            elif (ii == len(myarray)-1):
                ToDo.write(myarray[ii])
            ii+=1
        ToDo = open ("To-DoList.txt" ,"r")
        file = ToDo.read()
        print(file)
    x = input ("Do u want to continue ..type y or n :")
ToDo.close()