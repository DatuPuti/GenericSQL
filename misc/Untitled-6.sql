SELECT  wo.WorkOrderID
        , wo.WorkOrderNo
        , wo.CustomerID
        , wo.SalesOrderID
        , wo.CustomerID
        --, so.SalesOrderID
        --, so.SalesOrderNo
        , co.Comment
        , co.Notes AS CommentNotes
        --, cn.Notes AS CustNotes
  FROM  dbo.WorkOrder AS wo

  --JOIN  dbo.SalesOrder AS so 
    --ON  so.SalesOrderID = wo.SalesOrderID

  JOIN  dbo.comments AS co 
    ON  co.SalesOrderID = wo.SalesOrderID

  --JOIN  dbo.CustomerNotes AS cn
    --ON  cn.CustomerID = wo.CustomerID

 WHERE  co.TransactionTypeID = '3'
   --AND  cn.TransactionTypeID = '3'
   AND  wo.WorkOrderNo = 'WO1733388'