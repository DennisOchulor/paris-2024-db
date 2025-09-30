import mysql.connector
from getpass import getpass
from mysql.connector import errorcode
from prettytable import PrettyTable

# Validate user input
def get_user_input_int(minval, maxval):
    num = minval - 1
    while not minval <= num <= maxval:
        try:
            num = int(input("Choice: "))
            if not minval <= num <= maxval:
                print(f"Please enter an Integer between {minval} and {maxval}!")
        except ValueError:
            print(f"Please enter an Integer between {minval} and {maxval}!")
    return num

# Display query results in a nice-looking table
def display(c):
    column_names = []
    for column in c.description:
        column_names.append(column[0])
    table = PrettyTable(column_names)
    table.add_rows(c.fetchall())
    print(table)

conn = None
connected = False
# Get user to enter username/password repeatedly until it works
while not connected:
    try:
        print("Attempting to connect to the database...")
        username = input("Username: ")
        password = getpass()
        conn = mysql.connector.connect(user=username,password=password,database="Paris2024_22472393",host="127.0.0.1")
        connected = conn.is_connected()
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("[ERROR]: Incorrect username or password\n")
        else:
            print("[ERROR]: " + err.msg)

print("Successfully connected to the database!\n")
choice = -1
while choice != 0:
    print("*******************")
    print("Main Menu")
    print("*******************")
    print("1) Show Archery Events")
    print("2) Show youngest/oldest Athlete")
    print("3) Show MAS/AUS Athletes")
    print("4) Show number of Athletes per Country")
    print("5) Insert a new Athlete")
    print("6) Search for Athletes")
    print("7) Update data for an Athlete")
    print("8) Delete an Athlete")
    print("--------------------")
    print("0) Exit")

    cursor = conn.cursor()
    choice = get_user_input_int(0,8)

    if choice == 1:
        cursor.execute("""SELECT * FROM Event WHERE sport_id = 'ARC'
                        AND start_date BETWEEN '2024-07-30' AND '2024-08-04';""")
        display(cursor)

    elif choice == 2:
        cursor.execute("""SELECT participant_id, name, gender, DATE_FORMAT(birthdate, '%e %M, %Y') AS birthdate,
                        TIMESTAMPDIFF(YEAR,birthdate,CURDATE()) AS Age FROM Athlete
                        WHERE birthdate = (SELECT MAX(birthdate) FROM Athlete)
                        OR birthdate = (SELECT MIN(birthdate) FROM Athlete);
                        """)
        display(cursor)

    elif choice == 3:
        cursor.execute("""SELECT Athlete.participant_id, name, gender, country_id
                        FROM Participant NATURAL JOIN Athlete 
                        WHERE Participant.country_id IN ('MAS','AUS')
                        ORDER BY country_id;
                        """)
        display(cursor)

    elif choice == 4:
        cursor.execute("""SELECT Country.country_id, Country.name, count(*) AS NumOfAthletes
                        FROM Participant INNER JOIN Country ON Participant.country_id = Country.country_id
                        WHERE p_type = 'A'
                        GROUP BY Country.country_id
                        ORDER BY NumOfAthletes DESC;""")
        display(cursor)

    elif choice == 5:
        try:
            print("Enter details of the new Athlete:")
            vals = (input("Name: "), input("Gender: "), input("CountryID: "), input("Height: "), input("Weight: "), input("Birthdate (yyyy/mm/dd): "))
            cursor.execute("CALL insertAthlete(%s,%s,%s,%s,%s,%s,@newid)",vals)
            conn.commit()
            print("Successfully added a new Athlete.")
        except mysql.connector.errors.Error as e:
            print("[ERROR]: " + e.msg)

    elif choice == 6:
        name = input("Enter name of Athlete to search: ")
        cursor.execute("SELECT * FROM Athlete WHERE name LIKE %s",(f"%{name}%",))
        display(cursor)

    elif choice == 7:
        try:
            par_id = input("ParticipantID of Athlete: ")
            print("Enter details of the updated Athlete:")
            name = input("Name: ")
            gender = input("Gender: ")
            countryID = input("CountryID: ")
            vals_ath = (name, gender, input("Height: "), input("Weight: "), input("Birthdate (yyyy/mm/dd): "), par_id)
            vals_par = (countryID, par_id)

            cursor.execute("""UPDATE Participant SET country_id = %s
                            WHERE participant_id = %s""", vals_par)
            cursor.close()
            cursor = conn.cursor()
            cursor.execute("""UPDATE Athlete
                            SET name = %s, gender = %s, height = %s, weight = %s, birthdate = %s
                            WHERE participant_id = %s""", vals_ath)
            conn.commit()
            print("Successfully edited the Athlete.")
        except mysql.connector.errors.Error as e:
            print("[ERROR]: " + e.msg)

    elif choice == 8:
        try:
            par_id = input("Enter ID of Athlete to delete: ")
            cursor.execute("DELETE FROM Participant WHERE participant_id = %s",(par_id,))
            conn.commit()
            print("Successfully deleted the Athlete.")
        except mysql.connector.errors.Error as e:
            print("[ERROR]: " + e.msg)

    elif choice == 0:
        conn.close()
        print("Goodbye and have a nice day!")

    cursor.close()
    if choice != 0: input("Press Enter to continue...\n")

