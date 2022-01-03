--------------------------------------------------------------------------------------------------
USE inse

BULK INSERT INSEE
FROM 'C:\Users\Data\MDB-INSEE-V2.csv' 
WITH
(
    FIRSTROW = 2
    ,FIELDTERMINATOR = ';'  --CSV field delimiter
    ,ROWTERMINATOR = '\n'   --Use to shift the control to next row
)
--------------------------------------------------------------------------------------------------
USE inse

BULK INSERT Laposte_Hexasmal
FROM 'C:\Users\Data\Laposte_Hexasmal.csv' 
WITH
(
    FIRSTROW = 2
    ,FIELDTERMINATOR = ';'  --CSV field delimiter
    ,ROWTERMINATOR = '\n'   --Use to shift the control to next row
)