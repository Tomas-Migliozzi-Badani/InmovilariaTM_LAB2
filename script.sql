USE master;
GO

IF DB_ID('Inmobiliaria') IS NULL
BEGIN
    CREATE DATABASE Inmobiliaria;
END
GO

USE Inmobiliaria;
GO


-- Tabla Propietarios

IF OBJECT_ID('dbo.Propietarios', 'U') IS NULL
BEGIN
    CREATE TABLE Propietarios
    (
        idPropietario INT IDENTITY(1,1) NOT NULL,
        nombre NVARCHAR(MAX) NOT NULL,
        apellido NVARCHAR(MAX) NOT NULL,
        dni NVARCHAR(MAX) NOT NULL,
        telefono NVARCHAR(MAX) NOT NULL,
        email NVARCHAR(MAX) NOT NULL,

        CONSTRAINT PK_Propietarios
        PRIMARY KEY (idPropietario)
    );
END
GO


-- Tabla Inquilinos

IF OBJECT_ID('dbo.Inquilinos', 'U') IS NULL
BEGIN
    CREATE TABLE Inquilinos
    (
        Id INT IDENTITY(1,1) NOT NULL,
        DNI NVARCHAR(MAX) NOT NULL,
        NombreCompleto NVARCHAR(MAX) NOT NULL,
        Telefono NVARCHAR(MAX) NOT NULL,
        Email NVARCHAR(MAX) NOT NULL,

        CONSTRAINT PK_Inquilinos
        PRIMARY KEY (Id)
    );
END
GO


-- Tabla utilizada por Entity Framework para controlar migraciones

IF OBJECT_ID('dbo.__EFMigrationsHistory', 'U') IS NULL
BEGIN
    CREATE TABLE __EFMigrationsHistory
    (
        MigrationId NVARCHAR(150) NOT NULL,
        ProductVersion NVARCHAR(32) NOT NULL,

        CONSTRAINT PK___EFMigrationsHistory
        PRIMARY KEY (MigrationId)
    );
END
GO


-- Registrar las migraciones que corresponden a esta estructura

IF NOT EXISTS (
    SELECT 1
    FROM __EFMigrationsHistory
    WHERE MigrationId = '20260819165711_Inicial'
)
BEGIN
    INSERT INTO __EFMigrationsHistory
        (MigrationId, ProductVersion)
    VALUES
        ('20260819165711_Inicial', '10.0.11');
END
GO


IF NOT EXISTS (
    SELECT 1
    FROM __EFMigrationsHistory
    WHERE MigrationId = '20260820204237_ActualizarModelos'
)
BEGIN
    INSERT INTO __EFMigrationsHistory
        (MigrationId, ProductVersion)
    VALUES
        ('20260820204237_ActualizarModelos', '10.0.11');
END
GO