/*
	Show # of forum threads per year
*/
SELECT  COUNT(ThreadID) AS NbrOfThreads ,
        YEAR([PinnedDate]) AS YrOfThreads
FROM    [Forum_Threads]
GROUP BY YEAR([PinnedDate])
ORDER BY YrOfThreads DESC;