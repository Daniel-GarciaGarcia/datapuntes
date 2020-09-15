# MongoDB Queries

## Queries

- Compañias cuyo nombre sea "Facebook": `{name:"Facebook"}`
- Que el nombre empiece por "face" (regex): `{name:/^face.*/i}`
- Que el nombre empiece por "face" y fundadas a partir del 2004 (and)
  - `{name:/^face.*/i, founded_year:{$gt:2004}}`
  - `{$and:[ {name:/^face.*/i} , {founded_year:{$gte:2004}} ]}`
- Que el nombre empiece por "face" o que se haya fundado en 2004
  - `{$or:[ {name:/^face.*/i} , {founded_year:{$eq:2004}} ]}`
- Compañias del 2004 y 2005
  - `{$or:[{founded_year:2004},{founded_year:2005}]}`
  - `{founded_year:{$in:[2004,2005]}}`
- Todas las compañias, menos las fundadas en 2004 y 2005
  - `{founded_year:{$nin:[2004,2005]}}`
- Todas las empresas que NO sean de la categoría enterprise
  - `{category_code:{$ne:"enterprise"}}`
- Empresas con al menos una oficina en `NY`
  - `{"offices.state_code":"NY"}`
  - `{"offices":{$elemMatch:{state_code:"NY"}}}`

- Empresas de 2 oficinas ($size) y todas las oficinas estan en "CA" ($all,$elemMatch)
  
```json
{
  "$and": [
    { "offices": {
        "$all": [
            { "$elemMatch": { "state_code": "CA" } }
        ]}
    },
    { "offices": { "$size": 2 } }
  ]
}
```

- Empresas con todas las oficinas en California y con mas de 2 oficinas
  
```json
{
  "$and": [
    { "offices": { "$all": [{ "$elemMatch": { "state_code": "CA" } }] } },
    { "offices": {"$not":{ "$size": 2 } } },
    { "offices": {"$not":{ "$size": 1 } } }
  ]
}
```

## Projections

- Devuelve solo el campo name y category_code `{name:1, category_code:1}`
- Devuelve nombre y categoria sin el ObjectId: `{name:1, category_code:1,_id:0}`

## Sorting

- Sort descending by name field Z-A: `{name:-1}`
- Sort ascending by name field A-Z: `{name:1}`

## Ref

[https://docs.mongodb.com/manual/reference/operator/query/]