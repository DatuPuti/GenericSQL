SELECT  its.*
  FROM  WorkOrder AS wo
  JOIN  WorkOrderDetails AS wod
    ON  wod.WorkOrderID = wo.WorkOrderID
  JOIN  ItemSpecs as its
    ON  its.ItemSpecID = wod.ItemSpecID
  JOIN  ItemBoms AS itb
    ON  itb.ItemID = its.ItemID

 WHERE  wo.WorkOrderNo = 'WO1733346'