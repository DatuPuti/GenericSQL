SELECT	
	dbo.AdditionalInfo.OwnerID
	,dbo.JobControlMain.JobControlMainID
	,dbo.JobControlMain.JobControlMainNo
	,dbo.JobControlMain.NAME AS [Opportunity Name]
/*
	,Employees_1.LastName AS [Assigned By]
	,dbo.Employees.LastName AS [Assign To]
*/
  FROM	dbo.AdditionalInfo

 full	join dbo.JobControlMain
    on	dbo.JobControlMain.JobControlMainID = dbo.AdditionalInfo.OwnerID
		
		
 --RIGHT	JOIN dbo.JobControlMain ON dbo.Estimate.JobControlMainID = dbo.JobControlMain.JobControlMainID