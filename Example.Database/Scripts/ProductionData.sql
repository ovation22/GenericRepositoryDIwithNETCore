DECLARE @name VARCHAR(255), @sql VARCHAR(MAX)
DECLARE TablesCursor CURSOR FOR 
	SELECT table_name 
	FROM INFORMATION_SCHEMA.TABLES 
	WHERE table_type = 'BASE TABLE'
	AND table_catalog = DB_NAME()
	AND table_schema = 'dbo'
OPEN TablesCursor
FETCH NEXT FROM TablesCursor INTO @name
WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @sql = 'ALTER TABLE [dbo].[' + @name + '] NOCHECK CONSTRAINT ALL;'
	PRINT @sql
	EXECUTE (@sql)
	FETCH NEXT FROM TablesCursor INTO @name
END
CLOSE TablesCursor
DEALLOCATE TablesCursor



PRINT ''
PRINT 'Colors'
IF NOT EXISTS (SELECT * FROM [dbo].[Colors]) 
BEGIN
INSERT [dbo].[Colors] ([Id], [Name], [Description]) 
	VALUES   (1, N'Gray', N'Characterized by progressive silvering of the colored hairs of the coat. Most gray horses have black skin and dark eyes; unlike many depigmentation genes, gray does not affect skin or eye color')
			,(2, N'Bay', N'A reddish brown body color with a black mane, tail, ear edges, and lower legs. Bay is one of the most common coat colors in many horse breeds.')
			,(3, N'Seal Brown', N'A near-black body color; with black points, the mane, tail and legs; but also reddish or tan areas around the eyes, muzzle, behind the elbow and in front of the stifle.')
			,(4, N'Chestnut', N'Consisting of a reddish-to-brown coat with a mane and tail the same or lighter in color than the coat. Genetically and visually, chestnut is characterized by the absolute absence of true black hairs.')
			,(5, N'Black', N'Black is a relatively uncommon coat color, and novices frequently mistake dark chestnuts or bays for black.')
			,(6, N'Roan', N'An even mixture of colored and white hairs on the body, while the head and "points"- lower legs, mane and tail are more solid-colored.')
			,(7, N'Palomino', N'A gold coat and white mane and tail. Genetically, the palomino color is created by a single allele of a dilution gene called the cream gene working on a "red" (chestnut) base coat.')
			,(8, N'White', N'White horses are born white and stay white throughout their life. White horses may have brown, blue, or hazel eyes. "True white" horses, especially those that carry one of the dominant white (W) genes, are rare.')
			,(9, N'Platinum', N'A silver color, more rich than dull gray.')			
END


PRINT ''
PRINT 'Horses'
SET IDENTITY_INSERT [dbo].[Horses] ON 
GO
IF NOT EXISTS (SELECT * FROM [dbo].[Horses])
BEGIN
	INSERT [dbo].[Horses] ([Id], [Name], [ColorId], [SireId], [DamId], [RaceStarts], [RaceWins], [RacePlace], [RaceShow], [Earnings]) 
	VALUES   (1, N'Camarero', 2, NULL, NULL, 76, 73, 2, 0, 43553)
			,(2, N'Hindoo', 2, NULL, NULL, 35, 30, 3, 2, 71875)
			,(3, N'Peppers Pride', 3, NULL, NULL, 19, 19, 0, 0, 1066085)
			,(4, N'Madelia', 4, NULL, NULL, 4, 4, 0, 0, 1385000)
			,(5, N'El Rio Rey', 2, NULL, NULL, 7, 7, 0, 0, 46835)
			,(6, N'Golden Fleece', 2, NULL, NULL, 4, 4, 0, 0, 283967)
			,(7, N'Personal Ensign', 2, NULL, NULL, 13, 13, 0, 0, 1679880)
			,(8, N'Landaluce', 3, 9, NULL, 5, 5, 0, 0, 372365)
			,(9, N'Seattle Slew', 3, NULL, NULL, 17, 14, 2, 0, 1208726)
			,(10, N'War Admiral', 3, NULL, NULL, 26, 21, 3, 1, 273240)
			,(11, N'Genuine Risk', 4, NULL, NULL, 15, 10, 3, 2, 646587)
			,(12, N'Lexington', 2, NULL, NULL, 7, 6, 1, 0, 56600)
			,(13, N'Whirlaway', 4, NULL, NULL, 60, 32, 15, 9, 561161)
			,(14, N'Citation', 2, NULL, NULL, 45, 32, 10, 2, 1085760)
			,(15, N'Donerail', 2, NULL, NULL, 62, 10, 11, 10, 15156)
			,(16, N'Shenanigans', 1, NULL, NULL, 22, 3, 1, 6, 18120)
			,(17, N'Affectionately', 2, 21, 22, 52, 28, 8, 6, 546659)
			,(18, N'Miesque', 2, NULL, NULL, 16, 12, 3, 1, 2096517)
			,(19, N'Davona Dale', 2, NULL, NULL, 18, 11, 2, 1, 641612)
			,(20, N'Ruffian', 3, NULL, NULL, 11, 10, 0, 0, 313429)
			,(21, N'Swaps', 4, NULL, NULL, 25, 19, 2, 2, 848900)
			,(22, N'Searching', 2, 10, NULL, 89, 25, 14, 16, 327381)
END
SET IDENTITY_INSERT [dbo].[Horses] OFF 
GO




DECLARE @name VARCHAR(255), @sql VARCHAR(MAX)
DECLARE TablesCursor CURSOR FOR 
	SELECT table_name 
	FROM INFORMATION_SCHEMA.TABLES 
	WHERE table_type = 'BASE TABLE'
	AND table_catalog = DB_NAME()
	AND table_schema = 'dbo'
OPEN TablesCursor
FETCH NEXT FROM TablesCursor INTO @name
WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @sql = 'ALTER TABLE [dbo].[' + @name + '] CHECK CONSTRAINT ALL;'
	PRINT @sql
	EXECUTE (@sql)
	FETCH NEXT FROM TablesCursor INTO @name
END
CLOSE TablesCursor
DEALLOCATE TablesCursor