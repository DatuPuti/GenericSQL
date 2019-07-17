SELECT	DISTINCT 
		OwnerID ,
 		ModuleID ,
		PropertyIndex ,
		Value
FROM 
    (SELECT DISTINCT OwnerID ,
         ModuleID ,
         PropertyIndex ,
         
        (SELECT value = STUFF( 
            (SELECT (',' + ISNULL(Value, '')) AS Expr1
            FROM dbo.AdditionalInfoValues AS t2
            WHERE (PropertyIndex = '81')
                    AND (ModuleID = '27')
                    AND (t1.OwnerID = OwnerID) FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')) AS Value
            FROM dbo.AdditionalInfoValues AS t1
            WHERE (ISNULL(Value, '') <> '') ) AS t
        WHERE (Value IS NOT NULL)
            AND PropertyIndex = '81' AND OwnerID = '89'