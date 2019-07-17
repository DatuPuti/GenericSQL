
SELECT	* /*ISNULL(Value, '') AS Expr1
		,PropertyIndex
		,OwnerID
		,Position
		*/
  FROM	dbo.AdditionalInfoValues AS t2
 where	PropertyIndex = 81
   and	ownerid = 60
  order	by ownerid
   --and	ownerid = 25
   --and	(ISNULL(Value, '') <> '')
/*
 WHERE	(t1.OwnerID = OwnerID)
   AND	(PropertyIndex = 81)
   AND	(ISNULL(Value, '') <> '')
--  FROM	dbo.AdditionalInfoValues AS t1

SELECT	DISTINCT OwnerID ,ModuleID
		,(SELECT	ISNULL(Value, '') AS Expr1
			FROM	dbo.AdditionalInfoValues AS t2
		   WHERE	(t1.OwnerID = OwnerID)
		     AND	(PropertyIndex = 81)
 			 AND	(ISNULL(Value, '') <> '')
		) AS Value
		FROM dbo.AdditionalInfoValues AS t1
		WHERE (ISNULL(Value, '') <> '')
		) AS t
	WHERE (Value IS NOT NULL)
	) AS RequestedStyle ON ai.ModuleID = RequestedStyle.ModuleID
*/
