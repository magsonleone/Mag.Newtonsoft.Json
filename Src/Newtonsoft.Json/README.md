# Mag.Newtonsoft.Json

Mag.Newtonsoft.Json is a fork of Newtonsoft.Json intended for side-by-side loading scenarios where the official `Newtonsoft.Json.dll` name can cause assembly conflicts.

The primary target scenario is plugin-based hosts such as Autodesk Revit. In those environments, several add-ins can run inside the same process and may require different Newtonsoft.Json versions. This package avoids that DLL Hell scenario by changing only the assembly name.

Namespaces are not renamed. Consumer code still uses:

```csharp
using Newtonsoft.Json;
```

The assembly name includes the package version. For version `13.0.4`, the generated assembly is:

```text
Mag.Newtonsoft.Json.13.0.4.dll
```

Use this package when you need a version-specific assembly identity. For regular .NET applications without assembly binding conflicts, use the official Newtonsoft.Json package.

## Serialize JSON

```csharp
Product product = new Product();
product.Name = "Apple";
product.Expiry = new DateTime(2008, 12, 28);
product.Sizes = new string[] { "Small" };

string json = JsonConvert.SerializeObject(product);
// {
//   "Name": "Apple",
//   "Expiry": "2008-12-28T00:00:00",
//   "Sizes": [
//     "Small"
//   ]
// }
```

## Deserialize JSON

```csharp
string json = @"{
  'Name': 'Bad Boys',
  'ReleaseDate': '1995-4-7T00:00:00',
  'Genres': [
    'Action',
    'Comedy'
  ]
}";

Movie m = JsonConvert.DeserializeObject<Movie>(json);

string name = m.Name;
// Bad Boys
```

## LINQ to JSON

```csharp
JArray array = new JArray();
array.Add("Manual text");
array.Add(new DateTime(2000, 5, 23));

JObject o = new JObject();
o["MyArray"] = array;

string json = o.ToString();
// {
//   "MyArray": [
//     "Manual text",
//     "2000-05-23T00:00:00"
//   ]
// }
```

## Links

- [Homepage](https://www.newtonsoft.com/json)
- [Documentation](https://www.newtonsoft.com/json/help)
- [Official NuGet Package](https://www.nuget.org/packages/Newtonsoft.Json)
- [Release Notes](https://github.com/JamesNK/Newtonsoft.Json/releases)
- [Contributing Guidelines](https://github.com/JamesNK/Newtonsoft.Json/blob/master/CONTRIBUTING.md)
- [License](https://github.com/JamesNK/Newtonsoft.Json/blob/master/LICENSE.md)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/json.net)
