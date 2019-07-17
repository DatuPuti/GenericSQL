select	(select count(RuleDesc) from _rptSalesTaxFooter where SalesOrderID=3017) as count
		,SalesOrderID
  from	_rptSalesTaxFooter
 where	SalesOrderID = 3017
 --order	by SalesOrderID