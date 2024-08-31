# Delete Existing Files
rm -rf Entries

# Ensure directories exist
mkdir -p Entries
mkdir -p Entries/Classes
mkdir -p Entries/Nebraska

# All Stock Cars
echo 'All Stock Car Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Stock Car' ORDER BY State" --pretty 2>&1 | tee Entries/Classes/AllStockCarEntries.txt
echo ''

# All Sport Mods
echo 'All Sport Mod Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Northern Sportmod' ORDER BY State" --pretty 2>&1 | tee Entries/Classes/AllSportModEntries.txt
echo ''

# All Hobby Stocks
echo 'All Hobby Stock Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Hobby Stock' ORDER BY State" --pretty 2>&1 | tee Entries/Classes/AllHobbyStockEntries.txt
echo ''

# All Modifieds
echo 'All Modified Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Modified' ORDER BY State" --pretty 2>&1 | tee Entries/Classes/AllModifiedEntries.txt
echo ''

# All Late Models
echo 'All Late Model Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Late Model' ORDER BY State" --pretty 2>&1 | tee Entries/Classes/AllLateModelEntries.txt
echo ''

# All Mod Lites
echo 'All Mod Lite Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Mod Lite' ORDER BY State" --pretty 2>&1 | tee Entries/Classes/AllModeLiteEntries.txt
echo ''

# All Sport Compacts
echo 'All Sport Compact Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Sport Compact' ORDER BY State" --pretty 2>&1 | tee Entries/Classes/AllSportCompactEntries.txt
echo ''

# All Nebraska Entries
echo 'All Nebraska Entires'
dsq SuperNationals42.csv "SELECT * FROM {} WHERE state = 'NE' ORDER BY class" --pretty 2>&1 | tee Entries/Nebraska/AllNebraskaEntries.txt
echo ''

# Mult-Class Drivers
echo 'Mult-Class Drivers'
dsq SuperNationals42.csv "SELECT * FROM {} WHERE name IN (SELECT name FROM {} GROUP BY name HAVING COUNT(*) > 1) ORDER BY name" --pretty 2>&1 | tee Entries/MulticlassDrivers.txt
echo ''

# All Entries
echo 'All Entries Ordered by class and state within class'
dsq SuperNationals42.csv "SELECT * FROM {} ORDER BY class ASC, state ASC " --pretty 2>&1 | tee Entries/AllEntriesOrdered.txt
echo ''
