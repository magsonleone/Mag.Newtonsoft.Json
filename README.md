# Mag.Newtonsoft.Json

This repository is a fork of [Newtonsoft.Json](https://github.com/JamesNK/Newtonsoft.Json) created for environments where multiple incompatible copies of `Newtonsoft.Json.dll` can be loaded into the same process.

The main use case is plugin-based hosts such as Autodesk Revit, where add-ins may depend on different Newtonsoft.Json versions and the shared process can run into DLL Hell or assembly binding conflicts.

## What Changed

The library namespaces and project names are intentionally unchanged. Code continues to use the standard `Newtonsoft.Json` namespace.

Only the assembly identity is changed. The package builds assemblies using this naming pattern:

```text
Mag.[OriginalAssemblyName].[PackageVersion].dll
```

For version `13.0.4`, the output assembly is:

```text
Mag.Newtonsoft.Json.13.0.4.dll
```

The internal assembly name is also:

```text
Mag.Newtonsoft.Json.13.0.4
```

This allows the package to be used side-by-side with the official `Newtonsoft.Json` assembly and with other versioned Mag.Newtonsoft.Json assemblies when a host application cannot reliably isolate dependencies.

## When To Use This Package

Use this fork when you need a version-specific assembly name to avoid runtime collisions in a shared AppDomain/process, especially in desktop plugin ecosystems such as Revit add-ins.

For normal .NET applications, web applications, services, and libraries that do not have assembly binding conflicts, prefer the official Newtonsoft.Json package from NuGet.org.

## Package Feed

This package is published to GitHub Packages:

```text
https://nuget.pkg.github.com/magsonleone/index.json
```

Package id:

```text
Mag.Newtonsoft.Json
```

## Upstream Project

This fork preserves the original Newtonsoft.Json source code except for the package and assembly naming changes required for side-by-side loading.

- [Homepage](https://www.newtonsoft.com/json)
- [Documentation](https://www.newtonsoft.com/json/help)
- [Official NuGet Package](https://www.nuget.org/packages/Newtonsoft.Json)
- [Release Notes](https://github.com/JamesNK/Newtonsoft.Json/releases)
- [Contributing Guidelines](CONTRIBUTING.md)
- [License](LICENSE.md)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/json.net)
