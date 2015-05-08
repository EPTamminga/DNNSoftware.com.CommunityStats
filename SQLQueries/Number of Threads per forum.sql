SELECT  [Name] ,
        [Description] ,
        [TotalThreads]
FROM    [Forum_Forums]
WHERE   IsActive = 1
        AND PublicView = 1
        AND ParentID <> 0
        AND TotalPosts IS NOT NULL
ORDER BY TotalThreads DESC;