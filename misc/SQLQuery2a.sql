select	*
  from	dbo.AdditionalInfoValues
 where	value = 'Quarter Pallet'
/*
 where	moduleid = 27 
   and	propertyIndex = 81
   and	ownerid = 60
*/

select	aiv.*
  from	dbo.AdditionalInfo as ai
  join	dbo.AdditionalInfoValues as aiv
		on aiv.OwnerID = ai.OwnerID
 where	ai.OwnerID = 89
   and	aiv.PropertyIndex = '81'
   and	aiv.ModuleID = 27