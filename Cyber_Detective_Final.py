import mysql.connector

def myprint(text):
    lenght = 60
    lul = text.split()
    used = 0
    for word in lul:
        if used + len(word) <= lenght:
            if used > 0:
                print(" ", end="")
                used+=1
            print(word, end="")
        else:
            print("")
            used = 0
            print(word, end="")
        used = used + len(word)
    print("")

def getloc():
    cur = db.cursor()
    sql = "SELECT LocationID FROM player"
    cur.execute(sql)
    loc = cur.fetchall()
    return loc[0][0]


def move(loc, direction):
    destination=loc
    cur = db.cursor()
    sql = "SELECT Destination FROM passage WHERE DirectionID='"+direction+"' \
           AND Source="+str(loc)+" AND Locked=0"
    cur.execute(sql)
    if cur.rowcount>0:
        for i in cur.fetchall():
            destination=i[0]
    else:
        destination = loc;
    return destination

def look_around(loc):
    cur = db.cursor()
    sql = "SELECT Description, Details \
           FROM location \
           WHERE LocationID=%d" % (loc)
    cur.execute(sql)
    for i in cur:
        myprint ("I'm in " + i[0] + ".")
        myprint(i[1])
    objects(loc)
    npc(loc)
    if loc in range(1,52) or loc in range(61,63) \
    or loc in range(70,72) or loc in range(86,88):
        passages(loc)
    return

def objects(loc):
    cur = db.cursor()
    sql = "SELECT objecttype.Description \
           FROM objecttype INNER JOIN object \
           ON objecttype.ObjectTypeID=object.ObjectTypeID \
           WHERE object.LocationID="+str(loc)+" \
           AND object.Available=1 \
           GROUP BY objecttype.Description ASC"
    cur.execute(sql)
    items = cur.fetchall()
    if cur.rowcount>0:
        print ("I can see: ")
        for item in items:
            print("  -", item[0], end="")
            if item != items[-1]:
                print(",")
            else:
                print(".")
    return

def npc(loc):
    cur = db.cursor()
    sql = "SELECT NpcName \
           FROM Npc INNER JOIN Location \
           ON Npc.LocationID=Location.LocationID \
           WHERE Npc.locationID="+str(loc)
    cur.execute(sql)
    npces = cur.fetchall()
    if cur.rowcount>0:
        print ("There's ", end="")
        for npc in npces:
            print(npc[0], end="")
            if npc != npces[-1]:
                print(", ", end="")
            else:
                print(" with me here.")
    return

def passages(loc):
    cur = db.cursor()
    sql = "SELECT Description, Locked, Locknote \
           FROM passage INNER JOIN direction \
           ON passage.DirectionID=direction.DirectionID WHERE Source="+str(loc)+" \
           ORDER BY Description ASC" 
    cur.execute(sql)
    print("The possible directions I can go from here are: ", end="")
    x = 0;
    for i in cur.fetchall():
        print(i[0], end="")
        x+=1
        if i[1]==1:
            print(" "+i[2], end="")
        if x < cur.rowcount:
            print(", ", end="")
    print(".")
    return

def unlock_passage(source, passage):
    cur = db.cursor()
    sql = "UPDATE passage SET Source="+str(source)+" WHERE PassageID="+str(passage)
    cur.execute(sql)
    return

def talk(loc, react):
    cur = db.cursor()
    sql = "SELECT DialogText FROM dialog INNER JOIN npc ON \
           dialog.NpcID=npc.NpcID WHERE npc.LocationID="+str(loc)+" \
           AND React="+str(react)
    cur.execute(sql)
    dialog = cur.fetchall()
    if cur.rowcount >=1:
        myprint(*dialog[0])
    else:
        print("There's no one around here to talk with.")
    return

def say(loc, word):
    cur = db.cursor()
    sql = "SELECT NpcName FROM npc WHERE LocationID="+str(loc)
    cur.execute(sql)
    npcs = cur.fetchall()
    if cur.rowcount>0:
        sql = "SELECT DialogText FROM dialog INNER JOIN npc ON \
               dialog.NpcID=npc.NpcID WHERE npc.LocationID="+str(loc)+" \
               AND React='"+word+"'"
        cur.execute(sql)
        dialog = cur.fetchall()
        if cur.rowcount >=1:
            myprint(*dialog[0])
        else:
            print("\"Sorry, I don't understand what you mean.\"")
    else:
        print("There's no one here to hear me.")
    return


def examine(target):
    cur = db.cursor()
    sql = "SELECT objecttype.Details FROM objecttype INNER JOIN object ON \
           objecttype.ObjectTypeID=object.ObjectTypeID \
           WHERE Refname='"+target+"' AND object.Available=TRUE \
           AND object.LocationID="+str(loc)+" OR object.PlayerID=1 AND Refname='"+target+"'"
    cur.execute(sql)
    details = cur.fetchall()
    if cur.rowcount>0:
        for i in details:
            myprint (i[0])
            
    else:
        myprint("I can't do that.")
    return

    
def take(target):
    cur = db.cursor()
    sql = "UPDATE object INNER JOIN objecttype \
           ON object.ObjectTypeID=objecttype.ObjectTypeID \
           SET object.LocationID=NULL, object.PlayerID=1 \
           WHERE objecttype.Refname='" + target + "' AND object.LocationID="+str(loc)+" \
           AND object.Available=TRUE AND object.Takeable=TRUE"
    cur.execute(sql)
    if cur.rowcount>0:
        print("I took the " + target + ".")
    else:
        myprint("I don't think the '" + target + "' is something " +
              "I can take with me here from here.")
    return cur.rowcount

def drop(target):
    cur = db.cursor()
    sql = "UPDATE object INNER JOIN objecttype ON \
           object.ObjectTypeID=objecttype.ObjectTypeID \
           SET object.LocationID='"+str(loc)+"', object.PlayerID=NULL \
           WHERE objecttype.Refname='"+target+"' AND object.PlayerID=1"
    cur.execute(sql)
    if cur.rowcount>0:
        print("I dropped the " + target + ".")
    else:
        print("I can't drop the " + target + ".")
    return cur.rowcount

def make_origami(target):
    cur = db.cursor()
    sql = "UPDATE object SET PlayerID=NULL, LocationID='40', Available=0, \
           Takeable=0 WHERE ObjectTypeID='paper' AND PlayerID=1"
    cur.execute(sql)
    if cur.rowcount>0:
        sql = "UPDATE object SET PlayerID=1 WHERE ObjectTypeID='"+target+"origami'"
        cur.execute(sql)
        myprint("I make my own "+target+" origami following " +
              "the instructions on the model.")
    else:
        print("I don't have any paper with me.")
    return

def into_paper(item):
    cur = db.cursor()
    sql = "UPDATE object SET PlayerID=NULL WHERE  PlayerID=1 AND \
           ObjectTypeID='"+item+"origami'"
    cur.execute(sql)
    if cur.rowcount>0:
        sql = "UPDATE object SET PlayerID=1, Available=1, Takeable=1 \
               WHERE ObjectTypeID='paper' AND LocationID='40'"
        cur.execute(sql)
        print("I fold my origami back into a sheet of paper. ")
    else:
        print("I don't have "+item+" origami on me.")
    return

def unlock(loc):
    cur = db.cursor()
    if loc==2 or loc==5 or loc==34:
        sql = "UPDATE passage SET Locked=0, Locknote=NULL \
               WHERE Source='"+str(loc)+"' OR Destination='"+str(loc)+"'"
        cur.execute(sql)
        if cur.rowcount>0:
            print("I unlocked the door. ")
        else:
            print("The door is already unlocked.")
    elif loc==38:
        sql = "SELECT PlayerID FROM object WHERE ObjectTypeID='key1'"
        cur.execute(sql)
        check = cur.fetchall()
        if check[0]==(1,):
            sql = "UPDATE passage SET Locked=0, Locknote=NULL \
                   WHERE Source='"+str(loc)+"' OR Destination='"+str(loc)+"'"
            cur.execute(sql)
            if cur.rowcount>0:
                myprint("I unlock the door into Body World with Eureka key.")
            else:
                myprint("The door into Body World is already unlocked.")
        else:
            myprint("I don't have the key to unlock the door.")
    elif loc==28:
        sql = "SELECT PlayerID FROM object WHERE ObjectTypeID='key2'"
        cur.execute(sql)
        check = cur.fetchall()
        if check[0]==(1,):
            sql = "UPDATE passage SET Locked=0, Locknote=NULL \
                   WHERE Source='"+str(loc)+"' OR Destination='"+str(loc)+"'"
            cur.execute(sql)
            if cur.rowcount>0:
                myprint("I unlock the door into Janitor's closet with Eureka key.")
            else:
                myprint("The Janitor's closet is already unlocked.")
        else:
            myprint("I don't have the key to unlock the closet.")
    else:
        myprint("There isn't a door here I could unlock.")
    return

def search(loc, target):
    cur = db.cursor()
    sql = "SELECT objecttype.Description FROM objecttype INNER JOIN object ON \
           objecttype.ObjectTypeID=object.ObjectTypeID \
           WHERE object.LocationID='"+str(loc)+"' AND object.Available=FALSE"
    cur.execute(sql)
    items = cur.fetchall()
    if cur.rowcount>0:
        print ("I search the "+target+". There's ", end="")
        for item in items:
            print(item[0], end="")
            if item != items[-1]:
                print(", ", end="")
            else:
                print(" inside it.")
    else:
        print("There's nothing new inside it. ")
    return

def inside(loc):
    cur = db.cursor()
    sql = "UPDATE object SET Available=TRUE WHERE LocationID='"+str(loc)+"'"
    cur.execute(sql)
    if cur.rowcount>0:
        for i in cur:
            print (i[0])
    return
    
def inventory():
    cur = db.cursor()
    sql = "SELECT objecttype.Refname FROM objecttype INNER JOIN object \
           ON objecttype.ObjectTypeID=object.ObjectTypeID \
           WHERE PlayerID = 1"
    cur.execute(sql)
    items = cur.fetchall()
    if cur.rowcount < 1:
        print("I don't have any items on me")
    else:
        for i in items:
            print("- " + i[0])
    return

def unlock_pc(loc):
    cur = db.cursor()
    sql = "UPDATE passage SET Locked=0, Locknote=NULL WHERE Source='"+str(loc)+"'"
    cur.execute(sql)
    if cur.rowcount>0:
        myprint("I successfully unlocked the computer. I can now enter the cyberspace here. ")
    else:
        myprint("I have already unlocked the computer and can use it to enter the cyberspace.")
    return

def movie(loc):
    cur = db.cursor()
    sql = "UPDATE npc SET LocationID='"+str(loc)+"' WHERE NpcName='Ray'"
    cur.execute(sql)
    myprint("An employee comes in and starts fixing the movie player.")
    myprint("")
    sql = "SELECT PlayerID FROM object WHERE ObjectTypeID='owlorigami'"
    cur.execute(sql)
    check = cur.fetchall()
    if check[0]==(1,):
        say(loc, "owl origami")
        myprint("")
        say(loc, "explain")
        myprint("")
        myprint("After the explanation Ray leaves the movie theater as the movie ends.")
        global ray
        ray=2
    else:
        say(loc, "tearsinrain")
        myprint("")
        myprint("The employee leaves the movie theater and I finish watching rest of the movie.")
    sql = "UPDATE npc SET LocationID=NULL WHERE NpcName='Ray'"
    cur.execute(sql)
    return

def wallet():
    cur = db.cursor()
    sql = "SELECT PlayerID FROM object WHERE ObjectTypeID='blackwallet'"
    cur.execute(sql)
    check = cur.fetchall()
    if check[0]==(1,):
        say(loc, target)
        sql = "UPDATE passage SET Locked=0, Locknote=NULL \
               WHERE Source='"+str(loc)+"' OR Destination='"+str(loc)+"'"
        cur.execute(sql)
        print("")
        if cur.rowcount>0:
            print("I may enter Eureka now.")
        else:
            print("I already had bought a ticket. What a waste of credits.")
    else:
        say(loc, "no wallet")
    return

def pack():
    cur = db.cursor()
    sql = "SELECT LocationID FROM npc WHERE NpcID=8"
    cur.execute(sql)
    check = cur.fetchall()
    if check[0]==(38,):
        sql = "SELECT PlayerID FROM object WHERE ObjectTypeID='pack'"
        cur.execute(sql)
        check = cur.fetchall()
        if check[0]==(1,) or check[1]==(1,):
            say(loc, target)
            print("")
            sql = "UPDATE object SET Available=1 WHERE ObjectTypeID='curjac'"
            cur.execute(sql)
            sql = "UPDATE npc SET LocationID=NULL WHERE NpcID=8"
            cur.execute(sql)
            myprint("The curator leaves to go smoke outside. He leaves his coat on the chair he was sitting on.")
        else:
            myprint("I shouldn't lie to him as I don't have any cigarette pack with me.")
    else:
        say(loc, target)
    return

def cooketears(target):
    cur = db.cursor()
    sql = "SELECT PlayerID FROM object WHERE ObjectTypeID='owlorigami'"
    cur.execute(sql)
    check = cur.fetchall()
    if check[0]==(1,):
        say(loc, target)
        sql = "UPDATE object SET PlayerID=1 WHERE ObjectID=109"
        cur.execute(sql)
        myprint("")
        sql = "UPDATE npc SET LocationID=NULL WHERE NpcID=6"
        cur.execute(sql)
        myprint("Cooke gives me a key and leaves the site.")
    else:
        say(loc, "blade runner")
    return

def evidence():
    cur = db.cursor()
    sql = "UPDATE object SET PlayerID=1 WHERE ObjectID=117"
    cur.execute(sql)
    return

def finish(loc, target):
    cur = db.cursor()
    sql = "SELECT PlayerID FROM object WHERE ObjectID=117"
    cur.execute(sql)
    check = cur.fetchall()
    if check[0]==(1,):
        say(loc, target)
        myprint("")
        myprint("Congratulations! You have solved the case and beaten the game!")
        myprint("")
        global action
        action="quit"
    else:
        say(loc, "4")
    return
        

db = mysql.connector.connect(
    host = "localhost",
    user = "dbuser",
    password = "dbpass",
    db = "cyberdetective",
    buffered = True)

print("")
myprint("Hello. I'm Scott Anderson. I live in a world which might remind " +
        "you of your own. In fact, it was pretty much the same untill early" +
        " 1980's but then my world seems to have taken an alternative route " +
        "from yours. It's currently year 2102 and the life isn't that cozy. " +
        "Instead of heading towards utopia for all of the mankind with the " +
        "development in technology and science, our world descended by the "
        "greediness into dystopian societies controlled by the world's " +
        "megacorporations. The last goverment was dismantled 25 years ago.")
print("")
myprint("Even though the societies got worse, the technological advancement " +
        "have been impressive. Humans have been able to build androids which " +
        "show no difference exteriorly or intellectually from humans. " +
        "Computers can be used to access a virtual dimension called " +
        "'Cyberspace'.")
print("")
myprint("I used to work as computer hacker, whom are called 'netrunners' " +
        "these days. But for me that's in the past now as I work as private " +
        "detective these days... ")
print("")
myprint("(Write 'help' or 'commands' to find out all the available commands " +
        "in this game.)")
print("-"*80)
print("")
print("")


loc = getloc()
look_around(loc)

action=""

#starting dialog for every NPC
lawson=1
norris=1
pender=1
beverley=1
olhouser=1
robby=1
donald=1
leon=1
rachael=1
ray=1
cooke=1



while action!="quit":

    print("")
    print("-"*80)
    print("")
    
    new_input = []
    player_input=input("What should I do: ")
    player_input=player_input.replace("'", "")
    player_input=player_input.replace('"', "")
    player_input= player_input.split()
    for word in player_input:
        if word not in ["go", "to", "at", "on", "the", "with", "on", "of", "bob", "joel", "kurt", "cole"]:
            new_input.append(word)
    if len(new_input)>=1:
        action = new_input[0].lower()
    else:
        action = ""
    if len(new_input)>=4:
        item = new_input[len(new_input)-3].lower()
        target = new_input[len(new_input)-2].lower() + " " + new_input[len(new_input)-1].lower()
    elif len(new_input)==3:
        item = ""
        target = new_input[len(new_input)-2].lower() + " " + new_input[len(new_input)-1].lower()
    elif len(new_input)==2:
        item = ""
        target = new_input[len(new_input)-1].lower()
    else:
        item = ""
        target = ""
    
    print("")


    #variant
    if action=="north":
        action="n"
    if action=="south":
        action="s"
    if action=="west":
        action="w"
    if action=="east":
        action="e"
    if action=="up":
        action="u"
    if action=="down":
        action="d"
    if action=="enter":
        if target=="car":
            action="enter car"
            target=""
        if target=="cyberspace":
            action="enter cyberspace"
            target=""
    if action=="exit" and target=="cyberspace":
        action="exit cyberspace"
        target=""
    if action=="board":
        action="notification board"
    if action=="i":
        action="inventory"
    if target=="seats":
        target="seat"
    if target=="string code":
        target="code"
    if target=="sheet paper":
        target="paper"
    if target=="answering machine":
        target="phone"
    if action=="use" and target=="phone":
        action="examine"
    if target=="freeman files":
        target="files"
    if target=="eureka files":
        target="files"
    if target=="norris files":
        target="files"
    if target=="j31":
        target="freeman"
    if action=="use" and target=="evidence lawson":
        action="say"
        target="evidence"
    if action=="use" and item=="black" and target=="wallet robby":
        action="say"
        item=""
        target="yes"
    if action=="use" and item=="cigarette" and target=="pack donald":
        action="say"
        item=""
        target="yes"
    if action=="use" and item=="owl" and target=="origami cooke":
        action="say"
        target="owl"
    

    #help/commands
    if action=="help" or action=="commands":
        myprint("The avalaible commands in this game are: ")
        print("   - 'look around' to tell you about surroundings\n" +
              "   - 'n/north', 'e/east', 's/south', 'w/west', \n" +
              "     'u/up', 'd/down' to move around \n" +
              "   - 'enter car' to enter your car while you are near it, \n" +
              "      while in the car you have to write your destination \n" +
              "      to drive there \n" +
              "   - 'enter/exit cyberspace' to enter/exit the cyberspace \n" +
              "      while you are in a tile with access to do so \n" +
              "   - 'unlock door' to try unlock a passage in your current \n" +
              "      location, some doors may require a correct key \n"
              "   - 'examine/inspect/look at + object' to give you details \n" +
              "      about the chosen object, the object needs to be in \n" +
              "      your inventory or available in your location \n" +
              "   - 'i/inventory' to show what objects you are carrying \n" +
              "   - 'take + (object)' to try take an object and place it \n" +
              "      in your inventory \n" +
              "   - 'drop + (object)' to drop an object that's in your inventory\n" +
              "   - 'use + (object)' to try using a object in your current location\n" +
              "   - 'use + object + target' to try using an object on another \n" +
              "      object or character \n" +
              "   - 'search + (object)' to search an object to see if it contains \n" +
              "      another object inside it \n" +
              "   - 'talk' to talk with an character in your location \n" +
              "   - 'say + (word)' to say out loud a word for another character \n"
              "      to hear in your location \n"
              "   - 'quit' to end your game ")
    
    #moving
    elif action=="n" or action=="e" or action=="s" or action=="w" \
    or action=="u" or action=="d" or action=="masons" or action=="warehouse" \
    or action=="eureka" or action=="scrapyard" or action=="home" \
    or action=="enter cyberspace" or action=="exit cyberspace":
        newloc = move(loc,action)
        if loc==newloc:
            print("I can't move to that direction.");
        else:
            loc = newloc
            look_around(loc)

    #look around
    elif action=="look" and target=="around":
        look_around(loc)

    #car
    elif action=="enter car":
        newloc = move(loc,action)
        if loc==newloc:
            print("My car isn't here. ");
        else:
            loc = newloc
            print("I start driving around, where should I head to? ")
            passages(loc)

    #talk
    elif action=="talk" or action=="speak":
        if loc==17:
            talk(loc, lawson)
            lawson+=1
            if lawson>4:
                lawson=2
        elif loc==23:
            talk(loc, norris)
            norris+=1
            if norris>3:
                norris=2
        elif loc==25:
            talk(loc, pender)
            pender+=1
            if pender>3:
                pender=2
        elif loc==26:
            talk(loc, beverley)
            beverley+=1
            if beverley>3:
                beverley=2
        elif loc==27:
            talk(loc, olhouser)
            olhouser+=1
            if olhouser>3:
                olhouser=2
        elif loc==36:
            talk(loc, robby)
            robby+=1
            if robby>3:
                robby=1
        elif loc==38:
            talk(loc, donald)
            donald+=1
            if donald>3:
                donald=2
        elif loc==39:
            talk(loc, leon)
        elif loc==40:
            talk(loc, rachael)
        elif loc==50:
            talk(loc,cooke)
            cooke+=1
            if cooke>3:
                cooke=2
            
            

    #say
    elif action=="say" and target!="":
        #buying a ticket into Eureka
        if target=="yes" and loc==36:
            wallet()
        #giving a pack of cigarettes to curator
        elif target=="yes" and loc==38:
            pack()
        #cooke
        elif target=="tearsinrain" and loc==50:
            cooketears(target)
        elif target=="evidence" and loc==17:
            finish(loc, target)
        else:
            say(loc, target)
            
    #take
    elif action=="take" and target!="":
        take(target)

    #drop
    elif action=="drop" and target!="":
        drop(target)

    #inventory
    elif action=="inventory":
        inventory()


    #examine/inspect/look at
    elif (action=="examine" or action=="inspect" \
    or action=="look") and target!="":
        examine(target)
        if target=="phone" and loc==2:
            unlock_passage(11, 22)
            myprint("")
            myprint("I may use my car now to drive to Masons.")
        elif target=="files":
            if loc==61:
                unlock_passage(11, 23)
                unlock_passage(11, 24)
                myprint("")
                myprint("I may use my car now to drive to Warehouse and Eureka.")
            elif loc==70:
                unlock_passage(11, 25)
                myprint("")
                myprint("I may use my car now to drive to Scrapyard.")
            elif loc==86:
                myprint("")
                myprint("I make a copy of the files on my memory implant. " +
                        "I should go show the evidence to Lawson now.")
                evidence()


    #unlock freeman's pc
    elif action=="use" and target=="computer" and loc==24:
        pcpass = input("What should I enter as the password: ")
        if pcpass=="Banan4":
            unlock_pc(loc)
        else:
            print("The password I entered was incorrect.")

                
    #make origami
    elif action=="use" and item=="paper" and target!="" and loc==40:
        if target=="bull model":
            target="bull"
        elif target=="elephant model":
            target="elephant"
        elif target=="dragon model":
            target="dragon"
        elif target=="mammoth model":
            target="mammoth"
        elif target=="owl model":
            target="owl"
        elif target=="swan model":
            target="swan"
        elif target=="unicorn model":
            target="unicorn"
        else:
            target=""
            print("I need to use the paper on a model I want to copy.")
        if target!="":
            make_origami(target)

    #origami into paper
    elif action=="use" and item!="" and target=="origami table":
        into_paper(item)
        
                
    #unlock
    elif action=="unlock" and target=="door":
        unlock(loc)

    #search
    elif action=="search" and target!="":
        if target=="drawer":
            if loc==1 or loc==2 or loc==24 or loc==27:
                search(loc, target)
                inside(loc)
        elif target=="coat" and loc==38:
            search(loc, target)
            inside(loc)
        elif target=="towels" and loc==29:
            search(loc, target)
            inside(loc)
            unlock_passage(loc, 140)
            ##################
        else:
            myprint("I can't search that. ")
            
    #movie theater
    elif action=="use" and target=="seat":
        if ray==1:
            myprint("I sit down on the seat and start watching " +
                    "the movie called 'Blade Runner'.")
            myprint("As the movie seems to be almost over, it gets stuck. " +
                    "Seems like I have to call in an employee to fix the " +
                    "movie player if I want to see the ending. ")
            myprint("")
            choice = input("Should I press the button to call in an employee: ")
            myprint("")
            if choice=="yes":
                movie(loc)	
            else:
                myprint("As the movie stays stuck, the movie player " +
                        "automaticly turns itself off.")
        else:
            myprint("I think I have seen enough movies for today. ")




    #quit
    elif action=="quit":
        print("Good bye.")

    #else
    else:
        print("I can't do that. ")





db.rollback()
db.close()
