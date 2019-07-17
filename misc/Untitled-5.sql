

--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING! 
SELECT TOP (100) PERCENT dbo.WorkOrder.WorkOrderID
	,dbo.WorkOrder.WorkOrderNo
	,dbo.SalesOrder.SalesOrderNo
    /*
	,dbo.WorkOrder.EntryDate AS Expr1
	,dbo.WorkOrderDetails.[LineNo] AS LN
	,dbo.WorkOrderDetails.DueDate AS lineItemDueDate
	,dbo.WorkOrderDetails.QtyOrdered - ISNULL(dbo.WorkOrderDetails.QtyComplete, 0) AS Qty
	,UOMs_1.UOMCode
	,dbo.UserDefined_Custom.UserDefined1 AS u1
	,dbo.UserDefined_Custom.UserDefined2 AS u2
	,dbo.UserDefined_Custom.UserDefined5 AS u5
	,dbo.UserDefined_Custom.UserDefined6 AS u6
	,dbo.UserDefined_Custom.UserDefined8 AS u8
	,dbo.UserDefined_Custom.UserDefined9 AS u9
	,dbo.UserDefined_Custom.UserDefined11 AS u11
	,dbo.UserDefined_Custom.UserDefined17 AS u17
	,dbo.UserDefined_Custom.UserDefined22 AS u22
	,dbo.UserDefined_Custom.UserDefined25 AS u25
	,dbo.UserDefined_Custom.UserDefined28 AS u28
	,dbo.UserDefined_Custom.UserDefined31 AS u31
	,dbo.UserDefined_Custom.UserDefined44 AS u44
	,dbo.UserDefined_Custom.UserDefined46 AS u46
	,dbo.UserDefined_Custom.UserDefined51 AS u51
	,dbo.UserDefined_Custom.UserDefined55 AS u55
	,dbo.UserDefined_Custom.UserDefined56 AS u56
	,dbo.UserDefined_Custom.UserDefined59 AS u59
	,dbo.UserDefined_Custom.UserDefined60 AS u60
	,dbo.UserDefined_Custom.UserDefined61 AS u61
	,dbo.UserDefined_Custom.UserDefined62 AS u62
	,dbo.UserDefined_Custom.UserDefined63 AS u63
	,dbo.UserDefined_Custom.UserDefined65 AS u65
	,dbo.UserDefined_Custom.UserDefined66 AS u66
	,dbo.UserDefined_Custom.UserDefined101
	,dbo.UserDefined_Custom.UserDefined106
	,dbo.UserDefined_Custom.UserDefined110
	,dbo.UserDefined_Custom.UserDefined113
	,dbo.UserDefined_Custom.UserDefined115
	,dbo.UserDefined_Custom.UserDefined117
	,dbo.UserDefined_Custom.UserDefined119
	,dbo.UserDefined_Custom.UserDefined129
	,dbo.UserDefined_Custom.UserDefined130
	,dbo.UserDefined_Custom.UserDefined131
	,dbo.UserDefined_Custom.UserDefined310
	,dbo.UserDefined_Custom.UserDefined312
	,Customers_1.Phone AS ToPhone
	,CASE 
		WHEN [SalesOrder].[CustomerShipToID] IS NULL
			THEN [Customers_1].[Name]
		ELSE [Customers].[Name]
		END AS ShiptoName
	,dbo.ItemSpecs.ItemNo
	,dbo.SalesOrder.CustomerPO
	,dbo.CustomerShipTo.NAME
	,Addresses_1.AddressL1
	,Addresses_1.AddressL2
	,Addresses_1.AddressL3
	,StateProv_1.StateProvCode
	,Cities_1.DescriptionShort AS City
	,dbo.Employees.FirstName + ' ' + dbo.Employees.LastName AS CSR
	,dbo.WorkOrderType.WorkOrderCode
	,dbo.UserDefined_Custom.UserDefined10
	,dbo.UserDefined_Custom.UserDefined41
	,dbo.WorkOrderDetails.WorkOrderDetailID
	,dbo.WorkOrderDetails.QtyOrdered
	,dbo.WorkOrderDetails.Reference AS RefWODetails
	,dbo.WorkOrderDetails.Comment AS ComntWOdetails
    */
	,dbo.CustomerNotes.Notes AS CustNotes
	,dbo.Comments.Comment AS [Comments CMNTS]
	,dbo.Comments.Notes AS [Notes CMNTS]
	,dbo.WorkOrder.Reference
FROM dbo.Customers WITH (NOLOCK)
RIGHT JOIN dbo.Cities AS Cities_1 WITH (NOLOCK)
RIGHT JOIN dbo.StateProv AS StateProv_1 WITH (NOLOCK)
RIGHT JOIN dbo.Tools AS dTool
LEFT JOIN dbo.DocumentStorage AS dDS ON dDS.CreatorID = CAST(dTool.ToolID AS INT)
RIGHT JOIN dbo.UOMs WITH (NOLOCK)
RIGHT JOIN dbo.ItemSpecs WITH (NOLOCK) ON dbo.UOMs.UOMID = dbo.ItemSpecs.UOMID
RIGHT JOIN dbo.WorkOrder WITH (NOLOCK)

LEFT JOIN dbo.CustomerNotes 
	ON dbo.WorkOrder.CustomerID = dbo.CustomerNotes.CustomerID

LEFT JOIN dbo.WorkOrderDetails WITH (NOLOCK) 
    ON dbo.WorkOrder.WorkOrderID = dbo.WorkOrderDetails.WorkOrderID 
    ON dbo.ItemSpecs.ItemSpecID = dbo.WorkOrderDetails.ItemSpecID 
LEFT JOIN dbo.UserDefined WITH (NOLOCK) 
    ON dbo.ItemSpecs.ItemSpecID = dbo.UserDefined.ItemSpecID 
LEFT JOIN dbo.UserDefined_Custom WITH (NOLOCK) 
    ON dbo.UserDefined_Custom.ItemSpecID = dbo.UserDefined.ItemSpecID 
LEFT JOIN dbo.Tools AS pTool
LEFT JOIN dbo.DocumentStorage AS pDS 
    ON pDS.CreatorID = CAST(pTool.ToolID AS INT) 
    ON pTool.ToolNo = dbo.UserDefined_Custom.UserDefined106 
    ON dTool.ToolNo = dbo.UserDefined_Custom.UserDefined101 
LEFT JOIN dbo.UOMs AS UOMs_1 
    ON dbo.WorkOrderDetails.UOMID = UOMs_1.UOMID 
LEFT JOIN dbo.Addresses WITH (NOLOCK) 
LEFT JOIN dbo.Cities WITH (NOLOCK) ON dbo.Addresses.CityID = dbo.Cities.CityID 
LEFT JOIN dbo.StateProv WITH (NOLOCK) ON dbo.Addresses.StateProvID = dbo.StateProv.StateProvID 
LEFT JOIN dbo.Countries WITH (NOLOCK) ON dbo.Addresses.CountryID = dbo.Countries.CountryID 


RIGHT JOIN dbo.FOB WITH (NOLOCK)
RIGHT JOIN dbo.Employees WITH (NOLOCK)
RIGHT JOIN dbo.SalesOrder WITH (NOLOCK)
LEFT JOIN dbo.Customers AS Customers_1 WITH (NOLOCK) ON dbo.SalesOrder.CustomerID = Customers_1.CustomerID
LEFT JOIN dbo.TermsCodes WITH (NOLOCK) ON dbo.SalesOrder.TermsCodeID = dbo.TermsCodes.TermsCodeID
LEFT JOIN dbo.CustomerShipTo WITH (NOLOCK)
LEFT JOIN dbo.Countries AS Countries_1 WITH (NOLOCK)
RIGHT JOIN dbo.Addresses AS Addresses_1 WITH (NOLOCK) 
    ON Countries_1.CountryID = Addresses_1.CountryID 
    ON dbo.CustomerShipTo.AddressID = Addresses_1.AddressID 
    ON dbo.SalesOrder.CustomerShipToID = dbo.CustomerShipTo.CustomerShipToID 
LEFT JOIN dbo.SalesReps WITH (NOLOCK) 
    ON dbo.SalesOrder.SalesRepID = dbo.SalesReps.SalesRepID 
    ON dbo.Employees.EmployeeID = dbo.SalesReps.EmployeeID 
    ON dbo.FOB.FOBID = dbo.SalesOrder.FOBID 
    --ON dbo.Comments.SalesOrderID = dbo.SalesOrder.SalesOrderID 
    ON dbo.Addresses.AddressID = Customers_1.AddressID 
LEFT JOIN dbo.ShipVia WITH (NOLOCK) 
    ON dbo.SalesOrder.ShipViaID = dbo.ShipVia.ShipViaID 
    ON dbo.WorkOrder.SalesOrderID = dbo.SalesOrder.SalesOrderID 
LEFT JOIN dbo.WorkOrderType 
    ON dbo.WorkOrder.WorkOrderTypeID = dbo.WorkOrderType.WorkOrderTypeID 
    ON StateProv_1.StateProvID = Addresses_1.StateProvID 
    ON Cities_1.CityID = Addresses_1.CityID 
    ON dbo.Customers.CustomerID = dbo.CustomerShipTo.CustomerID 

RIGHT JOIN dbo.Comments ON dbo.Comments.SalesOrderID = dbo.WorkOrder.SalesOrderID

WHERE ((dbo.CustomerNotes.TransactionTypeID = 3) and (dbo.Comments.TransactionTypeID = 3) )
   OR ((dbo.CustomerNotes.TransactionTypeID IS NULL) AND (dbo.Comments.TransactionTypeID IS NULL))

    AND workorderno = 'WO1733388'