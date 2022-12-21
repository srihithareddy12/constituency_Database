import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate
import os


def option2():
    try:
        sql = "SELECT Fname,Lname,COUNT(*) AS No_of_Wins from Winner GROUP BY Fname,Lname;"
        cur.execute(sql)
        table = cur.fetchall()
        print()
        print("No of times each MLA won / probability of each winner")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)



def option3():
    try:
        sql = "SELECT Party_First_Name,Party_Middle_Name,Party_Last_Name,COUNT(*) AS No_of_MLAs from Winner WHERE Term='2015' GROUP BY Party_First_Name,Party_Middle_Name,Party_Last_Name ORDER BY Party_First_Name,Party_Middle_Name,Party_Last_Name ASC LIMIT 1;"
        cur.execute(sql)
        table = cur.fetchall()
        print()
        print("Find the ruling party")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def option4():
    try:
        sql = "SELECT * FROM Winner WHERE Term='2010';"
        cur.execute(sql)
        table = cur.fetchall()
        print()
        print("constituency election Winners of year 2010")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def option5():
    try:
        sql = "select Fname,Lname from Winner except select Winner_First_Name,Winner_Last_Name from Swindle;"
        cur.execute(sql)
        table = cur.fetchall()
        print()
        print("Winners of constiteuncy elections not invloved in any swindle")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option6():
    try:
        sql = "select Winner_First_Name,Winner_Last_Name,SUM(Scam_amount) as TOTAL_SCAM from Policies GROUP BY Winner_First_Name,Winner_Last_Name;"
        cur.execute(sql)
        table = cur.fetchall()
        print()
        print("Total scammed amount by an MLA ")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option7():
    try:
        sql = "select Winner_First_Name,Winner_Last_Name,AVG(Success_Rate) as SUCCESS_RATE from Policies GROUP BY Winner_First_Name,Winner_Last_Name;"
        cur.execute(sql)
        table = cur.fetchall()
        print()
        print("Estimated success rate when implementing a new policy")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option8():
    try:
        sql = "select Age_Group,Percentage_s from Supporters WHERE Winner_First_Name='Harula' AND Winner_Last_Name='Raghava';"
        cur.execute(sql)
        table = cur.fetchall()
        print()
        print("Supporters List of MLA Harula Raghava")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def update1():
    print()
    print("Update Success Rate: ")
    print()
    Participant = input("Policy_name: ")
    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        newRate = input("New Sucess rate: ")
        try:
            query = """UPDATE Policies SET `Success_Rate` = %s WHERE `Policy_Name` = %s ;"""
            cur.execute(query, (newRate, Participant))
            con.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'Number of matches'")
            return
        print("Updated the requested entry. Updated entry looks like: ")
        query = """SELECT * FROM Policies ;"""
        cur.execute(query)
        table = cur.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return

def update2():
    print()
    print("Update Contact number of a member: ")
    print()
    contact = input("Contact: ")
    Member_First_Name = input ("Member_First_Name: ")
    Member_Last_Name = input ("Member_Last_Name: ")
    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        try:
            query = """UPDATE Contact SET `contact` = %s WHERE `Member_First_Name` = %s AND `Member_Last_Name` = %s"""
            cur.execute(query, (contact,Member_First_Name,Member_Last_Name))
            con.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'Number of matches'")
            return
        print("Updated the new memeber: ")
        query = """SELECT * FROM Contact ;"""
        cur.execute(query)
        table = cur.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return

def update3():
    print()
    print("Update Party of a member: ")
    print()
    Member_First_Name = input ("Member_First_Name: ")
    Member_Last_Name = input ("Member_Last_Name: ")
    party_first_Name = input ("Party_First_Name: ")
    party_middle_Name = input ("Party_Middle_Name: ")
    party_Last_Name = input ("Party_Last_Name: ")
    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        try:
            query = """UPDATE Members SET `Party_First_Name` = %s , `Party_Middle_Name` =%s , `Party_Last_Name` =%s WHERE `First_Name` = %s AND `Last_Name` =%s ;"""
            cur.execute(query, (party_first_Name,party_middle_Name,party_Last_Name,Member_First_Name,Member_Last_Name))
            con.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'Number of matches'")
            return
        print("Updated the new memeber: ")
        query = """SELECT * FROM Members ;"""
        cur.execute(query)
        table = cur.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 10):
        update3()
    elif(ch == 1):
        option2()
    elif(ch == 2):
        option3()
    elif(ch == 3):
        option4()
    elif(ch == 4):
        option5()
    elif(ch == 5):
        option6()
    elif(ch == 6):
        option7()
    elif(ch == 7):
        option8()
    elif(ch == 8):
        update1()
    elif(ch == 9):
        update2()

    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="Shravya@123",
                              db='TEAM32',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                print("1. No of times each MLA won / probability of each winner")  # Hire an Employee
                print("2. Find the ruling party") 
                print("3. Constituency election Winners of year 2010") 
                print("4. Winners of constiteuncy elections not invloved in any swindle")  
                print("5. Total scammed amount by an MLA")
                print("6. Estimated success rate when implementing a new policy")
                print("7. Supporters List of MLA Harula Raghava")
                print("8. Updating Success Rate of a policy")
                print("9. Updating contact of a member")
                print("10. Updating Party of a member")
                print("11. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 11:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")