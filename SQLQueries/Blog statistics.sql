
SELECT ModuleID, NAA.ArticleID
,Count( NAA.[ArticleID]) as NbrOFArticles
,Count( NAC.COmmentID) as NBrOfComments
  FROM [DnnForge_NewsArticles_Article] as NAA
  inner join DnnForge_NewsArticles_Comment as NAC on NAA.ArticleID = NAC.ArticleID
  group by ModuleID, NAA.ArticleID
  

/* # of Comments */  
SELECT ModuleID, NAA.Title, NAA.ArticleID
,Count( NAA.[ArticleID]) as NbrOFArticles
,Count( NAC.COmmentID) as NBrOfComments
  FROM [DnnForge_NewsArticles_Article] as NAA
  inner join DnnForge_NewsArticles_Comment as NAC on NAA.ArticleID = NAC.ArticleID
  group by ModuleID, NAA.ArticleID, NAA.Title
  
  
SELECT TOP 20 NAA.Title
	, NAA.CreatedDate, NAA.StartDate, NAA.EndDate,NAA.IsDraft
	,NAA.IsApproved
	,NAA.SHortURL
	,NAA.URL
  FROM [DnnForge_NewsArticles_Article] as NAA
  ORDER By NAA.StartDate DESC
