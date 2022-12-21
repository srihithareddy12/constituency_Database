#### TEAM 32
### QUERIES

# SELECT Fname,Lname,COUNT(*) AS No_of_Wins from Winner GROUP BY Fname,Lname;
     calculates the number of times a candidate served as an MLA.
# SELECT Party_First_Name,Party_Middle_Name,Party_Last_Name,COUNT(*) AS No_of_MLAs from Winner WHERE Term='2015' GROUP BY Party_First_Name,Party_Middle_Name,Party_Last_Name ORDER BY Party_First_Name,Party_Middle_Name,Party_Last_Name ASC LIMIT 1;
    calculates the ruling party of the term "2015" based on the winner list.
# SELECT * FROM Winner WHERE Term='2010';
    outputs the winner list during the term "2010".
# select Fname,Lname from Winner except select Winner_First_Name,Winner_Last_Name from Swindle;
    outputs the list of candidates who don't have scam history under his service.
# select Winner_First_Name,Winner_Last_Name,SUM(Scam_amount) as TOTAL_SCAM from Policies GROUP BY Winner_First_Name,Winner_Last_Name;
    calculates the total scam amount under a candidate for all the poilicies he implimented under his service.
# select Winner_First_Name,Winner_Last_Name,AVG(Success_Rate) as SUCCESS_RATE from Policies GROUP BY Winner_First_Name,Winner_Last_Name;
     calculates the estimated success rate of a candidate when he implements a policy.
# select Winner_First_Name,Winner_Last_Name,Age_Group,Percentage_s from Supporters WHERE Winner_First_Name='Harula' AND Winner_Last_Name='Raghava';
    outputs the supporters list of "Harula Raghava"
# Update Success Rate: 
    updates the success rate of poilicies.
# Update Contact number of a member: 
    updates the contact number of members.
