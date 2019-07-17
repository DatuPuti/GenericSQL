DECLARE @TableName NVARCHAR(128) = 'ItemSpecProps';
DECLARE @SearchTerm NVARCHAR(128) = '3743'

SET NOCOUNT ON;

DECLARE @s NVARCHAR(MAX) = '';

WITH [tables] AS
(
    SELECT [object_id] 
        FROM sys.tables AS t
        WHERE (name = @TableName OR @TableName IS NULL)
        AND EXISTS
        (
            SELECT 1 
                FROM sys.columns
                WHERE [object_id] = t.[object_id]
                AND system_type_id IN (35,99,167,175,231,239)
        )
)
SELECT @s = @s + 'SELECT ''' 
    + REPLACE(QUOTENAME(OBJECT_SCHEMA_NAME([object_id])),'''','''''')
    + '.' + REPLACE(QUOTENAME(OBJECT_NAME([object_id])), '''','''''')
    + ''',* FROM ' + QUOTENAME(OBJECT_SCHEMA_NAME([object_id]))
    + '.' + QUOTENAME(OBJECT_NAME([object_id])) + ' WHERE ' + 
    (
        SELECT QUOTENAME(name) + ' LIKE ' + CASE 
            WHEN system_type_id IN (99,231,239) 
            THEN 'N' ELSE '' END
            + '''%' + @SearchTerm + '%'' OR '
        FROM sys.columns
        WHERE [object_id] = [tables].[object_id]
        AND system_type_id IN (35,99,167,175,231,239)
        ORDER BY name
        FOR XML PATH(''), TYPE
).value('.[1]', 'nvarchar(max)') + CHAR(13) + CHAR(10)
FROM [tables];

SELECT @s = REPLACE(@s,' OR ' + CHAR(13),';' + CHAR(13));

/*
    make sure you use Results to Text and adjust Tools / Options / 
    Query Results / SQL Server / Results to Text / Maximum number
    of characters if you want a chance at trusting this output 
    (the number of tables/columns will certainly have the ability
    to exceed the output limitation)
*/

SELECT @s;
-- EXEC sp_executeSQL @s;