SELECT *
FROM [dbo].[Sheet1$]
WHERE [Reference #] LIKE '%AMA%'


SELECT *
FROM [dbo].[Sheet1$]
WHERE [Reference #] LIKE '%AMA%' and [Status] = 'Ordered'

SELECT *
FROM [dbo].[Sheet1$]
WHERE [Total incomes] = 310;

UPDATE [dbo].[Sheet1$]
SET [Total incomes] = 90
WHERE [Total incomes] = 310;


SELECT *
FROM [dbo].[Sheet1$]
WHERE [Reference #] LIKE '%AMA%' AND [Status] = 'Ordered'
AND [Created1] = 'Arman Manoukyan';

SELECT *
FROM [dbo].[Sheet1$]
where [FCL/LCL] = 'fcl'


SELECT *
FROM [dbo].[Sheet1$]
WHERE [Created1] = 'Arman Manoukyan';

SELECT *
FROM [dbo].[Sheet1$]
WHERE [Status] = 'Ordered' AND [Created1] = 'Arman Manoukyan';

UPDATE [dbo].[Sheet1$]
SET [Total incomes] = 90;



