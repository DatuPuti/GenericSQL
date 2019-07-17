SELECT ai.AdditionalInfoID
	,ai.ModuleID
	,ai.OwnerID
	,ai.UserDefined2 AS Design
	,ai.UserDefined3 AS DesignRevisionNo
	,ai.UserDefined4 AS DesignBudget
	,ai.UserDefined7 AS ProductSupplied
	,ai.UserDefined10 AS Style
	,ai.UserDefined11 AS BoardType
	,ai.UserDefined12 AS ClosureType
	,ai.UserDefined15 AS InsideSide
	,ai.UserDefined16 AS MaxOD
	,ai.UserDefined18 AS ArrivingDate
	--,RequestedStyle.Value AS RequestedStyle
	--,DisplayLocation.Value AS DisplayLocation
	--,DesignRequested.Value AS DesignRequested
	--,ShippingTypeNeeded.Value AS ShippingTypeNeeded
	--,Quantities.Value AS Quantities
FROM dbo.AdditionalInfo AS ai
LEFT JOIN (
	SELECT OwnerID
		,Value
		,ModuleID
	FROM (
		SELECT DISTINCT OwnerID
			,ModuleID
			,(
				SELECT ISNULL(Value, '') AS Expr1
				FROM dbo.AdditionalInfoValues AS t2
				WHERE (t1.OwnerID = OwnerID)
					AND (PropertyIndex = 81)
					AND (ISNULL(Value, '') <> '')
				) AS Value
		FROM dbo.AdditionalInfoValues AS t1
		WHERE (ISNULL(Value, '') <> '')
		) AS t
	WHERE (Value IS NOT NULL)
	) AS RequestedStyle ON ai.ModuleID = RequestedStyle.ModuleID
/*
LEFT JOIN (
	SELECT OwnerID
		,Value
		,ModuleID
	FROM (
		SELECT DISTINCT OwnerID
			,ModuleID
			,(
				SELECT ISNULL(Value, '') AS Expr1
				FROM dbo.AdditionalInfoValues AS t2
				WHERE (t1.OwnerID = OwnerID)
					AND (PropertyIndex = 82)
					AND (ISNULL(Value, '') <> '')
				) AS Value
		FROM dbo.AdditionalInfoValues AS t1
		WHERE (ISNULL(Value, '') <> '')
		) AS t
	WHERE (Value IS NOT NULL)
	) AS DisplayLocation ON ai.ModuleID = DisplayLocation.ModuleID
LEFT JOIN (
	SELECT OwnerID
		,Value
		,ModuleID
	FROM (
		SELECT DISTINCT OwnerID
			,ModuleID
			,(
				SELECT ISNULL(Value, '') AS Expr1
				FROM dbo.AdditionalInfoValues AS t2
				WHERE (t1.OwnerID = OwnerID)
					AND (PropertyIndex = 2)
					AND (ISNULL(Value, '') <> '')
				) AS Value
		FROM dbo.AdditionalInfoValues AS t1
		WHERE (ISNULL(Value, '') <> '')
		) AS t
	WHERE (Value IS NOT NULL)
	) AS DesignRequested ON ai.ModuleID = DesignRequested.ModuleID
LEFT JOIN (
	SELECT OwnerID
		,Value
		,ModuleID
	FROM (
		SELECT DISTINCT OwnerID
			,ModuleID
			,(
				SELECT ISNULL(Value, '') AS Expr1
				FROM dbo.AdditionalInfoValues AS t2
				WHERE (t1.OwnerID = OwnerID)
					AND (PropertyIndex = 85)
					AND (ISNULL(Value, '') <> '')
				) AS Value
		FROM dbo.AdditionalInfoValues AS t1
		WHERE (ISNULL(Value, '') <> '')
		) AS t
	WHERE (Value IS NOT NULL)
	) AS ShippingTypeNeeded ON ai.ModuleID = ShippingTypeNeeded.ModuleID
LEFT JOIN (
	SELECT OwnerID
		,Value
		,ModuleID
	FROM (
		SELECT DISTINCT OwnerID
			,ModuleID
			,(
				SELECT ISNULL(Value, '') AS Expr1
				FROM dbo.AdditionalInfoValues AS t2
				WHERE (t1.OwnerID = OwnerID)
					AND (PropertyIndex = 84)
					AND (ISNULL(Value, '') <> '')
				) AS Value
		FROM dbo.AdditionalInfoValues AS t1
		WHERE (ISNULL(Value, '') <> '')
		) AS t
	WHERE (Value IS NOT NULL)
	) AS Quantities ON ai.ModuleID = Quantities.ModuleID
*/
WHERE (ai.ModuleID = 27)


