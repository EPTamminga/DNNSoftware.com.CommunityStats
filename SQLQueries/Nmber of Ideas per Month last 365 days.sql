SELECT  YEAR(CI.CreatedOnDate) AS TheYear ,
        MONTH(CI.CreatedOnDate) AS TheMonth ,
        COUNT(ID.IdeaId) AS NbrOfIdeas ,
        COUNT(ID.[Views]) AS NbrOfViews ,
        COUNT(ID.[Votes]) AS NbrOfVotes
FROM    [Ideas_Idea] AS ID
        INNER JOIN dbo.ContentItems AS CI ON CI.ContentItemID = ID.ContentItemId
WHERE   ID.Authorized = 1
        AND CI.CreatedOnDate > ( GETDATE() - 365 )
GROUP BY YEAR(CI.CreatedOnDate) ,
        MONTH(CI.CreatedOnDate)
ORDER BY TheYear DESC ,
        TheMonth DESC;
