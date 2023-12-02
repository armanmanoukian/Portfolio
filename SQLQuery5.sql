Select * 
From [dbo].[Sheet1$]


SELECT *
FROM [dbo].[Sheet1$]
WHERE [Reference #] LIKE '%AMA%'

UPDATE [dbo].[Sheet1$]
SET [Total incomes] = 90
WHERE [Total incomes] = 310;


SELECT *
FROM [dbo].[Sheet1$]
WHERE [Reference #] LIKE '%AMA%' AND [Status] = 'Ordered'
AND [Created1] = 'Arman Manoukyan';

SELECT *
FROM [dbo].[Sheet1$]
WHERE [Reference #] LIKE '%AMA%'
AND [Status] = 'Ordered'
AND [Created1] = 'Arman Manoukyan'
AND [Date of order] BETWEEN '2023-01-01' AND '2023-11-30'; 


SELECT DISTINCT *
FROM [dbo].[Sheet1$];

SELECT DISTINCT *
FROM [dbo].[Sheet1$]
WHERE [I/E] = 'Import'
AND [Reference #] LIKE '%AMA%'
AND [Created1] = 'Arman Manoukyan'
AND [Status] = 'Ordered';


SELECT DISTINCT *
FROM [dbo].[Sheet1$]
WHERE [I/E] = 'Export' 
AND [Reference #] LIKE '%AMA%'
AND [Created1] = 'Arman Manoukyan'
AND [Status] = 'Ordered';



SELECT COUNT(*) AS ExportOrderedCount
FROM [dbo].[Sheet1$]
WHERE [I/E] = 'Import'
AND [Created1] = 'Arman Manoukyan'
AND [Status] = 'Ordered';