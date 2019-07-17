
/*
SELECT PetID, OwnerID, PetName, AnimalType FROM Pet ORDER BY PetID
SELECT PetDetailID, PetID, DetailType, DetailValue FROM PetDetail ORDER BY PetDetailID
*/

--PIVOT QUERY HERE…
SELECT
        OwnerID
        , AnimalType
        , Pet1Name = MAX([PetName1])
        , Pet1Gender = MAX([Gender1])
        , Pet1Breed = MAX([Breed1])
        , Pet2Name = MAX([PetName2])
        , Pet2Gender = MAX([Gender2])
        , Pet2Breed = MAX([Breed2])
        , Pet3Name = MAX([PetName3])
        , Pet3Gender = MAX([Gender3])
        , Pet3Breed = MAX([Breed3])
   FROM ( SELECT
                  p.OwnerID
                  , p.PetName
                  , p.AnimalType
                  , pd.DetailType
                  , pd.DetailValue
                  ,pd.DetailType + CAST(DENSE_RANK() OVER (PARTITION BY p.OwnerID ORDER BY p.PetName ASC) AS NVARCHAR) AS [PetNumber]
                  ,'PetName' + CAST(DENSE_RANK() OVER (PARTITION BY p.OwnerID ORDER BY p.PetName ASC) AS NVARCHAR) AS [PetNamePivot]
            FROM  Pet p
           INNER  JOIN PetDetail pd ON p.PetID = pd.PetID
        ) AS query

PIVOT (MAX(DetailValue)
      FOR PetNumber IN ([Gender1],[Gender2],[Gender3], [Breed1], [Breed2], [Breed3])) AS Pivot1
PIVOT (MAX(PetName)
      FOR PetNamePivot IN ([PetName1],[PetName2],[PetName3])) AS Pivot2

GROUP BY OwnerID, AnimalType
ORDER BY OwnerID