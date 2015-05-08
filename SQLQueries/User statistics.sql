/* Nog aan te passen: begin van de maand */
SELECT  YEAR(CreatedOnDate) AS TheYear ,
        MONTH(CreatedOnDate) AS TheMonth ,
        COUNT(UserID) AS NbrOfRegistrations
FROM    {databaseOwner}[{objectQualifier}Users]
WHERE   CreatedOnDate > ( GETDATE() - 365 )
GROUP BY YEAR(CreatedOnDate) ,
        MONTH(CreatedOnDate)
ORDER BY TheYear DESC ,
        TheMonth DESC


SELECT  YEAR(CreatedOnDate) AS TheYear ,
        MONTH(CreatedOnDate) AS TheMonth ,
        DAY(CreatedOnDate) AS TheDay ,
        COUNT(UserID) AS NbrOfRegistrations
FROM    {databaseOwner}[{objectQualifier}Users]
WHERE   CreatedOnDate > ( GETDATE() - 30 )
GROUP BY YEAR(CreatedOnDate) ,
        MONTH(CreatedOnDate) ,
        DAY(CreatedOnDate)
ORDER BY TheYear DESC ,
        TheMonth DESC ,
        TheDay DESC


SELECT  YEAR(CreatedOnDate) AS TheYear ,
        COUNT(UserID) AS NbrOfRegistrations
FROM    {databaseOwner}[{objectQualifier}Users]
GROUP BY YEAR(CreatedOnDate)
ORDER BY TheYear DESC



/* Met cumulatieven */
SELECT  YEAR(d.CreatedOnDate) as TheYear,
        COUNT(f.UserID) Registrations ,
        COUNT(f.UserID)
        + COALESCE(( SELECT COUNT(dd.UserID)
                     FROM   {databaseOwner}[{objectQualifier}Users] fs
                            JOIN {databaseOwner}[{objectQualifier}Users] dd ON fs.UserID = dd.UserID
                     WHERE  YEAR(dd.CreatedOnDate) < YEAR(d.CreatedOnDate)
                   ), 0) CumRegistrations
FROM    {databaseOwner}[{objectQualifier}Users] f
        INNER JOIN {databaseOwner}[{objectQualifier}Users] d ON f.UserID = d.UserID
GROUP BY YEAR(d.CreatedOnDate)
ORDER BY YEAR(d.CreatedOnDate) DESC

