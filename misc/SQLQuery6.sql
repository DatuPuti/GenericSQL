/****** Script for SelectTopNRows command from SSMS  ******/
SELECT	[AdditionalInfoValueID]
		,[ModuleID]
		,[OwnerID]
		,[Position]
		,[PropertyIndex]
		,[Value]
  FROM	[ActiveM_CBDisplay].[dbo].[AdditionalInfoValues]
 order	by PropertyIndex,ownerid