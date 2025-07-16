SELECT Customer_ID, First_Name, Last_Name, Country FROM Customer WHERE Country NOT IN ('US','USA','United States');

SELECT C.First_Name, C.Last_Name, I.Invoice_ID, I.Invoice_Date, I.Billing_Country
FROM Customer C, Invoice I WHERE C.Customer_ID = I.Customer_ID
AND C.Country = 'Brazil';

SELECT E.First_Name, E.Last_Name, I.Invoice_ID, I.Customer_ID, I.Invoice_Date, I.Total
FROM Employee E
JOIN Customer C ON E.Employee_ID = C.Support_Rep_ID
JOIN Invoice I ON C.Customer_ID = I.Customer_ID
ORDER BY E.Employee_ID;

SELECT I.Total, C.First_Name, C.Last_Name, C.Country, E.First_Name, E.Last_Name
FROM Invoice I
JOIN Customer C ON I.Customer_ID = C.Customer_ID
JOIN Employee E ON C.Support_Rep_ID = E.Employee_ID
ORDER BY Total DESC;

SELECT COUNT(DISTINCT Invoice_ID), SUM(Total)
FROM Invoice
WHERE Invoice_Date BETWEEN DATE '2009-01-01' AND DATE '2011-12-31';

SELECT COUNT(DISTINCT Invoice_Line_ID) AS Line_Total
FROM Invoice_Line
WHERE Invoice_ID = 37;

SELECT Invoice_ID, COUNT(DISTINCT Invoice_Line_ID) AS Line_Total
FROM Invoice_Line
GROUP BY Invoice_ID;

SELECT IL.*, T.Name
FROM Track T
JOIN Invoice_Line IL ON T.Track_ID = IL.Track_ID;

SELECT IL.Invoice_Line_ID, T.Name AS Track_Name, Ar.Name AS Artist_Name
FROM Invoice_Line IL
JOIN Track T ON IL.Track_ID = T.Track_ID
JOIN Album Al ON T.Album_ID = Al.Album_ID
JOIN Artist Ar on Al.Artist_ID = Ar.Artist_ID;

SELECT Billing_Country, COUNT(DISTINCT Invoice_ID)
FROM Invoice I
GROUP BY Billing_Country;

SELECT P.Name, COUNT(DISTINCT PT.Track_ID) AS No_Of_Tracks
FROM Playlist P
JOIN Playlist_Track PT ON P.Playlist_ID = PT.Playlist_ID
GROUP BY P.Playlist_ID;

SELECT T.Name, A.Title, MT.Name, G.Name
FROM Track T
JOIN Album A ON T.Album_ID = A.Album_ID
JOIN Media_Type MT ON T.Media_Type_ID = MT.Media_Type_ID
JOIN Genre G ON T.Genre_ID = G.Genre_ID;

SELECT E.Employee_ID, E.First_Name, E.Last_Name, COUNT(DISTINCT I.Invoice_ID) AS Number_Of_Sales
FROM Employee E
JOIN Customer C ON E.Employee_ID = C.Support_Rep_ID
JOIN Invoice I ON C.Customer_ID = I.Customer_ID
GROUP BY E.Employee_ID;

SELECT E.Employee_ID, E.First_Name, E.Last_Name, SUM(I.Total) AS Total_Sales
(SELECT E.Employee_ID, E.First_Name, E.Last_Name, SUM(I.Total) AS Total
FROM Employee E
JOIN Customer C ON E.Employee_ID = C.Support_Rep_ID
JOIN Invoice I ON C.Customer_ID = I.Customer_ID
GROUP BY E.Employee_ID);

SELECT E.Employee_ID, E.First_Name, E.Last_Name, SUM(I.Total) AS Total_Sales
FROM Employee E
JOIN Customer C ON E.Employee_ID = C.Support_Rep_ID
JOIN Invoice I ON C.Customer_ID = I.Customer_ID
GROUP BY E.Employee_ID, E.First_Name, E.Last_Name
ORDER BY Total_Sales DESC
LIMIT 1;

select t.name, count(t.track_id)
from invoice_line as il
	join invoice as i on i.invoice_id = il.invoice_id
	join track as t on t.track_id = il.track_id
where i.invoice_date between '2013-01-01' and '2013-12-31'
group by t.track_id
order by count desc

SELECT T.Name, COUNT(T.Track_ID) AS Highest_Sales
FROM Invoice_Line IL
JOIN Invoice I ON I.Invoice_ID = IL.Invoice_ID
JOIN Track T ON T.Track_id = IL.Track_ID
WHERE I.Invoice_Date BETWEEN DATE '2013-01-01' AND DATE '2013-12-31'
GROUP BY T.Name
ORDER BY Highest_Sales DESC;
