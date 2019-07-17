SELECT  
        ai.AdditionalInfoID
        , ai.ModuleID
        , ai.OwnerID
        , ai.UserDefined2 AS Design
        , ai.UserDefined3 AS DesignRevisionNo
        , ai.UserDefined4 AS DesignBudget
        , ai.UserDefined7 AS ProductSupplied
        , ai.UserDefined10 AS Style
        , ai.UserDefined11 AS BoardType
        , ai.UserDefined12 AS ClosureType
        , ai.UserDefined15 AS InsideSide
        , ai.UserDefined16 AS MaxOD
        , ai.UserDefined18 AS ArrivingDate
        , RequestedStyle.Value AS RequestedStyle
		, DisplayLocation.Value AS DisplayLocation
		, DesignRequested.Value AS DesignRequested
		, ShippingTypeNeeded.Value AS ShippingTypeNeeded
		, Quantities.Value AS Quantities
FROM dbo.AdditionalInfo AS ai

LEFT JOIN 
    (SELECT DISTINCT
        OwnerID
        , ModuleID
        , PropertyIndex
        , Value
    FROM 
        (SELECT DISTINCT OwnerID 
            , ModuleID 
            , PropertyIndex 
            , (SELECT value = STUFF(
                (SELECT (',' + ISNULL(Value, '')) AS Expr1
                FROM dbo.AdditionalInfoValues AS t2
                WHERE (PropertyIndex = '81')
                        AND (ModuleID = '27')
                        AND (t1.OwnerID = OwnerID) FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')) AS Value
                FROM dbo.AdditionalInfoValues AS t1
                WHERE (ISNULL(Value, '') <> '') ) AS t
                WHERE (Value IS NOT NULL)
                        AND PropertyIndex = '81' ) AS RequestedStyle
ON ai.OwnerID = RequestedStyle.OwnerID

LEFT JOIN 
    (SELECT DISTINCT 
        OwnerID 
        , ModuleID 
        , PropertyIndex 
        , Value
    FROM 
        (SELECT DISTINCT OwnerID 
            , ModuleID 
            , PropertyIndex 
            , (SELECT value = STUFF(
                (SELECT (',' + ISNULL(Value, '')) AS Expr1
                FROM dbo.AdditionalInfoValues AS t2
                WHERE (PropertyIndex = '82')
                        AND (ModuleID = '27')
                        AND (t1.OwnerID = OwnerID) FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')) AS Value
                FROM dbo.AdditionalInfoValues AS t1
                WHERE (ISNULL(Value, '') <> '') ) AS t
                WHERE (Value IS NOT NULL)
                        AND PropertyIndex = '82' ) AS DisplayLocation
 ON ai.ownerid = DisplayLocation.OwnerID

LEFT JOIN 
    (SELECT DISTINCT 
        OwnerID 
        , ModuleID 
        , PropertyIndex 
        , Value
    FROM 
        (SELECT DISTINCT OwnerID 
            , ModuleID 
            , PropertyIndex 
            , (SELECT value = STUFF(
                (SELECT (',' + ISNULL(Value, '')) AS Expr1
                FROM dbo.AdditionalInfoValues AS t2
                WHERE (PropertyIndex = '2')
                        AND (ModuleID = '27')
                        AND (t1.OwnerID = OwnerID) FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')) AS Value
                FROM dbo.AdditionalInfoValues AS t1
                WHERE (ISNULL(Value, '') <> '') ) AS t
                WHERE (Value IS NOT NULL)
                        AND PropertyIndex = '2' ) AS DesignRequested
 ON ai.ownerid = DesignRequested.OwnerID

LEFT JOIN 
    (SELECT DISTINCT 
        OwnerID 
        , ModuleID 
        , PropertyIndex 
        , Value
    FROM 
        (SELECT DISTINCT OwnerID 
            , ModuleID 
            , PropertyIndex 
            , (SELECT value = STUFF(
                (SELECT (',' + ISNULL(Value, '')) AS Expr1
                FROM dbo.AdditionalInfoValues AS t2
                WHERE (PropertyIndex = '85')
                        AND (ModuleID = '27')
                        AND (t1.OwnerID = OwnerID) FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')) AS Value
                FROM dbo.AdditionalInfoValues AS t1
                WHERE (ISNULL(Value, '') <> '') ) AS t
                WHERE (Value IS NOT NULL)
                        AND PropertyIndex = '85' ) AS ShippingTypeNeeded
 ON ai.ownerid = ShippingTypeNeeded.OwnerID

LEFT JOIN 
    (SELECT DISTINCT 
        OwnerID 
        , ModuleID 
        , PropertyIndex 
        , Value
    FROM 
        (SELECT DISTINCT OwnerID 
            , ModuleID 
            , PropertyIndex 
            , (SELECT value = STUFF(
                (SELECT (',' + ISNULL(Value, '')) AS Expr1
                FROM dbo.AdditionalInfoValues AS t2
                WHERE (PropertyIndex = '84')
                        AND (ModuleID = '27')
                        AND (t1.OwnerID = OwnerID) FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')) AS Value
                FROM dbo.AdditionalInfoValues AS t1
                WHERE (ISNULL(Value, '') <> '') ) AS t
                WHERE (Value IS NOT NULL)
                        AND PropertyIndex = '84' ) AS Quantities
 ON ai.ownerid = Quantities.OwnerID

  WHERE (ai.ModuleID = 27) AND (ai.OwnerID = RequestedStyle.OwnerID)