SELECT 
	dbo.AdditionalInfo.OwnerID
	,dbo.JobControlMain.JobControlMainNo
	,dbo.JobControlMain.NAME AS [Opportunity Name]
	,Employees_1.LastName AS [Assigned By]
	,dbo.Employees.LastName AS [Assign To]
	/*
	,dbo.TransWorkFlowDetails.TaskNo
	,dbo.WorkFlowDetails.TaskDescription
	,dbo.JobControlMain.DateCreated - dbo.WorkFlowDetails.DaysDue AS [Due Date]
	,dbo.WorkFlowDetails.DaysDue
	,dbo.Estimate.EstimateNo
	,dbo.SalesOrder.SalesOrderNo
	,dbo.TransWorkFlowDetails.Completed
	,dbo.SalesOrder.SalesOrderID
	,dbo.Estimate.EstimateID
	,dbo.JobControlMain.JobControlMainID
	,dbo.JobControlMain.DateCreated
	,dbo.JobControlMain.StartDate
	,dbo.JobControlMain.EndDate
	*/
FROM dbo.AdditionalInfo

FULL JOIN dbo.Estimate
RIGHT JOIN dbo.JobControlMain ON dbo.Estimate.JobControlMainID = dbo.JobControlMain.JobControlMainID

LEFT JOIN dbo.SalesOrder ON dbo.Estimate.EstimateID = dbo.SalesOrder.EstimateID ON dbo.AdditionalInfo.OwnerID = dbo.JobControlMain.JobControlMainID 
FULL JOIN dbo.TransWorkFlow ON dbo.JobControlMain.JobControlMainID = dbo.TransWorkFlow.OwnerID 
FULL JOIN dbo.WorkFlow
FULL JOIN dbo.WorkFlowDetails ON dbo.WorkFlow.WorkFlowID = dbo.WorkFlowDetails.WorkFlowID
FULL JOIN dbo.TransWorkFlowDetails

FULL JOIN dbo.Employees ON dbo.TransWorkFlowDetails.AssignedToEmployeeID = dbo.Employees.EmployeeID
FULL JOIN dbo.Employees AS Employees_1 ON dbo.TransWorkFlowDetails.AssignedByID = Employees_1.EmployeeID 
			ON dbo.WorkFlowDetails.WorkFlowDetailID = dbo.TransWorkFlowDetails.WorkFlowDetailID 
			ON dbo.TransWorkFlow.TransWorkFlowID = dbo.TransWorkFlowDetails.TransWorkFlowID 
			
			
WHERE (dbo.TransWorkFlow.OwnerTypeId = 36) AND (dbo.TransWorkFlowDetails.Completed = 0)

