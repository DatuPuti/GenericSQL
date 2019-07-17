SELECT  *
  FROM  dbo.CustomerNotes AS cn
 WHERE  cn.CustomerID = '71'
   AND  cn.TransactionTypeID = '3'

SELECT  *
  FROM  dbo.Comments AS co
 WHERE  co.SalesOrderID = '3381'
   AND  co.TransactionTypeID = '3'

SELECT  *
  from  dbo.SalesOrder AS so 
 WHERE  so.SalesOrderID = '3381'

SELECT  *
  from  dbo.WorkOrder AS wo 
 WHERE  wo.WorkOrderNo = 'WO1733388'