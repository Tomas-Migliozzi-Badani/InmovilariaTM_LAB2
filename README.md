# InmobiliariaTM

Proyecto desarrollado para la materia **Laboratorio de Programación II**.

## Descripción

InmobiliariaTM es una aplicación web desarrollada con **ASP.NET Core MVC** para la gestión de una inmobiliaria.

En la primera etapa del proyecto se implementan operaciones ABM (Alta, Baja y Modificación) para:

- Propietarios.
- Inquilinos.

La aplicación utiliza **Entity Framework Core** para el acceso a datos y **SQL Server Express** como motor de base de datos.

---

## Tecnologías utilizadas

- C#
- ASP.NET Core MVC
- .NET 10
- Entity Framework Core 10.0.11
- SQL Server Express
- Bootstrap
- Git / GitHub

---

## Requisitos

Para ejecutar el proyecto es necesario tener instalado:

- [.NET 10 SDK](https://dotnet.microsoft.com/)
- SQL Server Express
- Git

Además, para utilizar las migraciones desde la terminal se necesita la herramienta `dotnet-ef`.

Puede instalarse con:

```bash
dotnet tool install --global dotnet-ef --version 10.0.11
```

Para comprobar la instalación:

```bash
dotnet ef --version
```

La versión esperada es:

```text
Entity Framework Core .NET Command-line Tools
10.0.11
```

---

## Clonar el repositorio

Clonar el proyecto con Git:

```bash
git clone https://github.com/Tomas-Migliozzi-Badani/InmovilariaTM_LAB2.git
```

Ingresar a la carpeta donde se encuentra el archivo `.csproj`.

Por ejemplo:

```bash
cd InmovilariaTM_LAB2
```

> Dependiendo de la estructura del repositorio, puede ser necesario ingresar a una carpeta interna hasta ubicarse en el directorio que contiene el archivo `.csproj`.

Puede comprobarse con:

```bash
dir *.csproj
```

---

## Configuración de SQL Server

El proyecto está configurado para utilizar una instancia local de **SQL Server Express** llamada:

```text
SQLEXPRESS
```

La cadena de conexión se encuentra en:

```text
appsettings.json
```

Actualmente es:

```text
Server=.\SQLEXPRESS;Database=Inmobiliaria;Trusted_Connection=True;TrustServerCertificate=True;
```

Esto significa que la aplicación utiliza:

- Servidor: `.\SQLEXPRESS`
- Base de datos: `Inmobiliaria`
- Autenticación: Windows

Si la instancia local de SQL Server tiene otro nombre, deberá modificarse la propiedad `DefaultConnection` dentro de `appsettings.json`.

---

## Restaurar dependencias

Desde una terminal ubicada en la carpeta del proyecto:

```bash
dotnet restore
```

Luego comprobar que el proyecto compile:

```bash
dotnet build
```

---

## Crear la base de datos

Actualmente el proyecto contiene migraciones de Entity Framework Core.

Para crear o actualizar la base de datos ejecutar:

```bash
dotnet ef database update
```

Si la operación finaliza correctamente debería mostrarse:

```text
Done.
```

Entity Framework utilizará la cadena de conexión definida en `appsettings.json` y creará/actualizará la base de datos `Inmobiliaria`.

### Migraciones incluidas

Actualmente el proyecto cuenta con migraciones para las entidades correspondientes a la primera entrega:

- Propietario.
- Inquilino.

---

## Ejecutar el proyecto

Ejecutar:

```bash
dotnet run
```

La terminal mostrará una dirección similar a:

```text
Now listening on: http://localhost:5064
```

Abrir en el navegador la dirección indicada por la terminal.

> El número de puerto puede cambiar según el entorno de ejecución.

---

## Funcionalidades implementadas

### Propietarios

El sistema permite:

- Listar propietarios.
- Registrar un nuevo propietario.
- Modificar los datos de un propietario.
- Eliminar un propietario.

Los datos utilizados actualmente para un propietario son:

- Id.
- Nombre.
- Apellido.
- DNI.
- Teléfono.
- Email.

### Inquilinos

El sistema permite:

- Listar inquilinos.
- Registrar un nuevo inquilino.
- Modificar los datos de un inquilino.
- Eliminar un inquilino.

Los datos utilizados actualmente para un inquilino son:

- Id.
- DNI.
- Nombre completo.
- Teléfono.
- Email.

---

## Navegación

Desde el menú principal se puede acceder a:

- Inicio.
- Propietarios.
- Inquilinos.

También pueden utilizarse directamente las rutas:

```text
/Propietario
/Inquilino
```

---

## Modelo de datos actual

En esta primera etapa se trabaja con las entidades `Propietario` e `Inquilino`.

Actualmente no existe una relación directa entre estas dos entidades.

### Propietario

```text
+---------------------------+
|       PROPIETARIO         |
+---------------------------+
| PK  IdPropietario         |
|     Nombre                |
|     Apellido              |
|     DNI                   |
|     Telefono              |
|     Email                 |
+---------------------------+
```

### Inquilino

```text
+---------------------------+
|        INQUILINO          |
+---------------------------+
| PK  Id                    |
|     DNI                   |
|     NombreCompleto        |
|     Telefono              |
|     Email                 |
+---------------------------+
```

Las relaciones con entidades como `Inmueble`, `Reserva` y `Pago` serán incorporadas en las siguientes etapas del proyecto de acuerdo con la narrativa proporcionada por la cátedra.

---

## Estructura principal del proyecto

```text
Controllers/
Data/
Migrations/
Models/
Views/
wwwroot/

Program.cs
appsettings.json
README.md
```

### Models

Contiene las entidades utilizadas por el sistema y los repositorios encargados del acceso a datos.

### Controllers

Contiene los controladores MVC que reciben las solicitudes del navegador y coordinan las operaciones del sistema.

### Views

Contiene las vistas Razor utilizadas para mostrar formularios, listados y demás interfaces de la aplicación.

### Data

Contiene el `DbContext` utilizado por Entity Framework Core para trabajar con la base de datos.

### Migrations

Contiene las migraciones de Entity Framework Core utilizadas para crear y actualizar el esquema de la base de datos.

---

## Script SQL

La consigna de la materia requiere incluir un archivo `script.sql` con las sentencias necesarias para crear e inicializar la base de datos.

**Este archivo se incorporará al repositorio antes de realizar la entrega definitiva.**

Mientras tanto, la base de datos puede generarse utilizando las migraciones incluidas en el proyecto:

```bash
dotnet ef database update
```

---

## Autor

**Tomás Migliozzi Badani**

Laboratorio de Programación II