# All Stock Cars
echo 'All Stock Car Entries'
dsq SuperNationals42.csv "SELECT city, name, state FROM {} WHERE class = 'Stock Car' ORDER BY State" --pretty 2>&1 | tee AllStockCarEntries.txt
echo ''

# All Nebraska Entries
echo 'All Nebraska Entires'
dsq SuperNationals42.csv "SELECT * FROM {} WHERE state = 'NE' ORDER BY class" --pretty 2>&1 | tee AllNebraskaEntries.txt
echo ''

# Mult-Class Drivers
echo 'Mult-Class Drivers'
dsq SuperNationals42.csv "SELECT * FROM {} WHERE name IN (SELECT name FROM {} GROUP BY name HAVING COUNT(*) > 1) ORDER BY name" --pretty 2>&1 | tee MulticlassDrivers.txt
echo ''

# All Entries
echo 'All Entries Ordered by class and state within class'
dsq SuperNationals42.csv "SELECT * FROM {} ORDER BY class ASC, state ASC " --pretty 2>&1 | tee AllEntriesOrdered.txt
echo ''
