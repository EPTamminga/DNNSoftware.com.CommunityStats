SELECT  COUNT(PostID) AS NbrOfPosts ,
        FF.Name
FROM    [Forum_Posts] AS FP
        INNER JOIN [Forum_Threads] AS FT ON FT.ThreadID = FP.ThreadID
        INNER JOIN [Forum_Forums] AS FF ON FF.ForumID = FT.ForumID
WHERE   FP.CreatedDate > ( GETDATE() - 365 )
        AND FF.PublicView = 1
GROUP BY FF.Name
ORDER BY NbrOfPosts DESC;