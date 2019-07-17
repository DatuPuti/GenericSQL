SELECT dbo.Customers.CustomerNo,
         dbo.Customers.Name AS CustomerName,
         dbo.CustomerShipTo.Name AS ShipToName,
         dbo.ItemSpecs.ItemNo,
         dbo.ItemSpecs.Name AS ItemName,
         dbo.SalesOrder.CustomerPO,
         dbo.UserDefined.UserDefined39 AS QtyPerSkid,
         dbo.WorkOrder.WorkOrderID,
         dbo.WorkOrderDetails.WorkOrderDetailID,
         dbo.WorkOrder.WorkOrderNo,
         dbo.SalesOrderDetails.SalesOrderDetailID,
         dbo.SalesOrder.SalesOrderID,
         dbo.Customers.CustomerID,
         dbo.ItemSpecs.ItemSpecID,
         dbo.Addresses.AddressL1,
         dbo.Addresses.AddressL2,
         dbo.Addresses.AddressL3,
         dbo.Addresses.AddressL4,
         dbo.Addresses.PostalCode,
         dbo.Cities.DescriptionShort AS City,
         dbo.Countries.DescriptionTiny AS Country,
         dbo.UserDefined.UserDefined38 AS SkidQty,
         dbo.StateProv.StateProvCode AS Province,
         dbo.WorkOrderDetails.QtyComplete,
         dbo.WorkOrderDetails.[LineNo]
FROM dbo.WorkOrder
INNER JOIN dbo.WorkOrderDetails
    ON dbo.WorkOrder.WorkOrderID = dbo.WorkOrderDetails.WorkOrderID
INNER JOIN dbo.SalesOrderDetails
    ON dbo.WorkOrderDetails.SalesOrderDetailID = dbo.SalesOrderDetails.SalesOrderDetailID
INNER JOIN dbo.SalesOrder
    ON dbo.SalesOrderDetails.SalesOrderID = dbo.SalesOrder.SalesOrderID
INNER JOIN dbo.Customers
    ON dbo.SalesOrder.CustomerID = dbo.Customers.CustomerID
INNER JOIN dbo.CustomerShipTo
    ON dbo.SalesOrder.CustomerShipToID = dbo.CustomerShipTo.CustomerShipToID
INNER JOIN dbo.ItemSpecs
    ON dbo.WorkOrderDetails.ItemSpecID = dbo.ItemSpecs.ItemSpecID
INNER JOIN dbo.UserDefined
    ON dbo.ItemSpecs.ItemSpecID = dbo.UserDefined.ItemSpecID
INNER JOIN dbo.Addresses
    ON dbo.SalesOrder.ShipToAddressID = dbo.Addresses.AddressID
INNER JOIN dbo.Cities
    ON dbo.Addresses.CityID = dbo.Cities.CityID
INNER JOIN dbo.Countries
    ON dbo.Addresses.CountryID = dbo.Countries.CountryID
INNER JOIN dbo.StateProv
    ON dbo.Addresses.StateProvID = dbo.StateProv.StateProvID LEFT OUTER
JOIN (SELECT UserDefined2 AS TagType, OwnerID FROM dbo.AdditionalInfo WHERE (ModuleID = 38)) AS CustomerTag
    ON dbo.Customers.CustomerID = CustomerTag.OwnerID


where dbo.WorkOrder.WorkOrderNo = 'WO1733123'