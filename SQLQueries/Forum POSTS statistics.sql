/*
	Show # of forum posts per year
*/
SELECT  COUNT(PostID) AS NbrOfPosts ,
        YEAR([CreatedDate]) AS YrOfPosts
FROM    [Forum_Posts]
WHERE   ( IsApproved = 1 )
GROUP BY YEAR([CreatedDate])
ORDER BY YrOfPosts DESC;