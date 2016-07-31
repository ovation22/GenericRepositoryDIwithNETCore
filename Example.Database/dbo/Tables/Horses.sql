CREATE TABLE [dbo].[Horses] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (50) NOT NULL,
    [ColorId]    TINYINT       NOT NULL,
    [SireId]     INT           NULL,
    [DamId]      INT           NULL,
    [RaceStarts] INT           NOT NULL,
    [RaceWins]   INT           NOT NULL,
    [RacePlace]  INT           NOT NULL,
    [RaceShow]   INT           NOT NULL,
    [Earnings]   INT           NOT NULL,
    CONSTRAINT [PK_Horses] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Horses_Color] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Colors] ([Id]),
    CONSTRAINT [FK_Horses_Dam] FOREIGN KEY ([DamId]) REFERENCES [dbo].[Horses] ([Id]),
    CONSTRAINT [FK_Horses_Sire] FOREIGN KEY ([SireId]) REFERENCES [dbo].[Horses] ([Id])
);

