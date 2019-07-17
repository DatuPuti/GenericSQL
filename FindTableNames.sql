use ActiveM_CBDisplay;

select	a.TABLE_NAME, b.COLUMN_NAME
  from	INFORMATION_SCHEMA.TABLES a,
		INFORMATION_SCHEMA.COLUMNS b 

 where	a.TABLE_SCHEMA = 'dbo' and b.TABLE_NAME = a.TABLE_NAME
   and	b.COLUMN_NAME like '%ownerid%'
   --and	b.COLUMN_NAME like '%die%'
   --and	b.COLUMN_NAME like '%descr%'
   --and	b.COLUMN_NAME like '%custid%'

 order	by a.TABLE_NAME

/*
select	b.COLUMN_NAME
  from	INFORMATION_SCHEMA.TABLES a,
		INFORMATION_SCHEMA.COLUMNS b 
 where	a.TABLE_SCHEMA = 'dbo'
   and	b.table_name = 'INVENTORY_ITEM_TAB'
   and	b.COLUMN_NAME like '%cust%'
*/
