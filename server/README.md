# Instructivo

Abre una ventana nueva de Terminal y corre esto en la carpeta server: 
```dotnet ef dbcontext scaffold " aqui va el connectionString de tu base de datos local" Microsoft.EntityFrameworkCore.SqlServer -o Models -f```

En ```Startup.cs``` cambia el valor de la variable ```connection``` por el connectionString de tu servidor local

Corre:

```dotnet build```

Si todo salio bien corre:

```dotnet run```

Despues de eso podras acceder a la API