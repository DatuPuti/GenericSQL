select WorkOrderID , WorkOrderNo 
       ,(select 'WO' + RIGHT(wo.WorkOrderNo, 4)) as newWO
  from dbo.workorder as wo


UPDATE  wo1 

   SET  wo1.WorkOrderNo =
        (select LEFT(wo2.WorkOrderNo,2) + RIGHT(wo2.WorkOrderNo,4))

  FROM  dbo.WorkOrder AS wo1
  INNER JOIN dbo.WorkOrder AS wo2
    ON wo2.WorkOrderID = wo1.WorkOrderID