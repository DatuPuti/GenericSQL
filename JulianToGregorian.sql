USE [ActiveM_CBDisplay_Purged]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertJulianToGregorianDate]    Script Date: 23/01/2017 2:18:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE FUNCTION dbo.ConvertJulianToGregorianDate
--ALTER FUNCTION [dbo].[ConvertJulianToGregorianDate]
(
  @JulianDate VARCHAR(7)
) RETURNS DATETIME
AS BEGIN
DECLARE @GregorianDate DATETIME

--SELECT @GregorianDate = DATEADD(dd, (@JulianDate % 1000) - 1, DATEADD(yy, @JulianDate / 1000, 0));
CAST(CAST(dbo.AdditionalInfo.UserDefined10 as INT) as DATETIME)
RETURN @GregorianDate

END