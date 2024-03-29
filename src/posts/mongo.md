# Mongo

## Install mongodb

```bash
sudo apt update
sudo apt install -y mongodb
```

- [download compass](https://www.mongodb.com/download-center/compass?jmp=docs)


## Import Export

- `mongoexport --db a2i --collection digital_centers --out digital_centers.json` **Export** collection from db.
- `mongoimport --db <database-name> --collection <collection-name> --file input.json` **Import** collection to a db.
- `db.door_step_services.renameCollection("agriculture_portals")` **Rename** collection.
- `mongodump -d a2i -o a2i_folder` **Export full shcema**.
- `mongorestore -d a2i /path/` **import bson**


## Insert

### insert to exesting document array or create new document and insert if limit exists

```js
db.post_comment.updateOne(
  { post: 1, childcount: { $lt: 3 } },
  {
    $push: { childs: { id: 1, content: "Content" } },
    $inc: { childcount: 1 },
  },
  { upsert: true }
);
```

### Filter Null value

```js
// here 10 is the value of "null"
db.inventory.find( { item : { $type: 10 } } )
```

# Query

### [Mongo Doc](https://docs.mongodb.com/manual/reference/operator/query/)
```js
{ _id: 1, item: { name: "ab", code: "123" }, qty: 15, tags: [ "A", "B", "C" ] }
{ _id: 2, item: { name: "cd", code: "123" }, qty: 20, tags: [ "B" ] }
{ _id: 3, item: { name: "ij", code: "456" }, qty: 25, tags: [ "A", "B" ] }
{ _id: 4, item: { name: "xy", code: "456" }, qty: 30, tags: [ "B", "A" ] }
{ _id: 5, item: { name: "mn", code: "000" }, qty: 20, tags: [ [ "A", "B" ], "C" ] }
```

### Comparison Query Operators

**eq** query.

```js
{ field: { "$eq": value } }
db.inventory.find( { qty: { "$eq": 20 } } )
db.inventory.find( { qty: 20 } )

db.inventory.find( { tags: { "$eq": [ "A", "B" ] } } )
db.inventory.find( { tags: [ "A", "B" ] } )
```

**gt** query.

```js
{field: {"$gt": value} }
db.inventory.find( { qty: { "$gt": 20 } } )
```

"gte"
**gte** query.

```js
{field: {"$gte": value} }
db.inventory.find( { qty: { "$gte": 20 } } )
```

**in** query.

```js
{ field: { "$in": [value1, value2, valueN ] } }
db.inventory.find( { qty: { "$in": [ 5, 15 ] } } )
```

**lt** query.

```js
{field: {"$lt": value} }
db.inventory.find( { qty: { "$lt": 20 } } )
```

**lte** query.

```js
{field: {"$lte": value} }
db.inventory.find( { qty: { "$lte": 20 } } )
```

**ne** query.

```js
{field: {"$ne": value} }
db.inventory.find( { qty: { "$ne": 20 } } )
```

**nin** query.

```js
{ field: { "$nin": [ value1, value2, valueN ]} }
db.inventory.find( { qty: { "$nin": [ 5, 15 ] } } )
```

### Logical Query Operators

**and** query.

```js
{ "$and": [ { expression1 }, { expression2 } , ... , { expressionN } ] }
db.inventory.find( { "$and": [ { price: { "$ne": 1.99 } }, { price: { "$exists": true } } ] } )
db.inventory.find( { "$and" : [{ "$or" : [ { price : 0.99 }, { price : 1.99 } ] }, { "$or" : [ { sale : true }, { qty : { "$lt" : 20 } } ] } ] } )
```

**not** query.

```js
{ field: { "$not": { operatorexpression } } }
db.inventory.find( { price: { "$not": { "$gt": 1.99 } } } )
"not and Regular Expressions"
db.inventory.find( { item: { "$not": { "$regex": "^p.*" } } } )
```

**nor** query.

```js
{ "$nor": [ { expression1 }, { expression2 },  { expressionN } ] }
db.inventory.find( { "$nor": [ { price: 1.99 }, { sale: true } ]  } )
"nor and Additional Comparisons"
db.inventory.find( { "$nor": [ { price: 1.99 }, { qty: { "$lt": 20 } }, { sale: true } ] } )
"nor and exists"
db.inventory.find( { "$nor": [ { price: 1.99 }, { price: { "$exists": false } }, { sale: true }, { sale: { "$exists": false } } ] } )
```

**or** query.

```js
{ "$or": [ { expression1 }, { expression2 }, ... , { expressionN } ] }
db.inventory.find( { "$or": [ { quantity: { "$lt": 20 } }, { price: 10 } ] } )
db.inventory.find( { "$or": [ { quantity: { "$lt": 20 } }, { price: 10 } ] } )
```

### Element Query Operators

**exists** query.

```js
{ field: { "$exists": boolean } }
db.inventory.find( { qty: { "$exists": true, "$nin": [ 5, 15 ] } } )
```

**type** query.

```js
"https://docs.mongodb.com/manual/reference/operator/query/type/#op._S_type"
{ field: { "$type": BSONtype } }
{ field: { "$type": BSONtype } }
db.addressBook.find( { "zipCode" : { "$type" : "string" } } )
```

### Array Query Operators

**all** query.

```js
{ field: { "$all": [ value1 , value2, valueN ] } }
{ tags: { "$all": [ "ssl" , "security" ] } }
{ "$and": [ { tags: "ssl" }, { tags: "security" } ] }
"Nested Array"
db.articles.find( { tags: { "$all": [ [ "ssl", "security" ] ] } } )
db.articles.find( { "$and": [ { tags: [ "ssl", "security" ] } ] } )
db.articles.find( { tags: [ "ssl", "security" ] } )
```

**elemMatch** query.

```js
{ field: { "$elemMatch": { query1, query2, ... } } }
db.scores.find( { results: { "$elemMatch": { "$gte": 80, "$lt": 85 } } } )
```

**size** query.

```js
db.collection.find( { field: { "$size": 2 } } )
```

### [projection Operators](https://docs.mongodb.com/manual/reference/operator/projection/)

**[projection](https://docs.mongodb.com/manual/reference/operator/projection/positional/)**

**[elemMatch](https://docs.mongodb.com/manual/reference/operator/projection/elemMatch/)**

**meta** query.

```bash
{ projectedFieldName: { "$meta": "textScore" } }
db.collection.find( query, { score: { "$meta": "textScore" } } )
```

**slice** query.

```bash
db.collection.find( { field: value }, { array: {"$slice": count } } )
# Here, $slice selects the first five items in an array in the comments field
db.posts.find( {}, { comments: { "$slice": 5 } } )
db.posts.find( {}, { comments: { "$slice": -5 } } )
# Here, the query will only return 10 items, after skipping the first 20 items of that array
db.posts.find( {}, { comments: { "$slice": [ 20, 10 ] } } )
db.posts.find( {}, { comments: { "$slice": [ -20, 10 ] } } )
```


## [Update](https://docs.mongodb.com/manual/reference/operator/update/)

### Field Update Operators

**set** query.

```js
{ $set: { <field1>: <value1>, ... } }
db.products.update( { _id: 100 }, { $set: { "details.make": "zzz" } } )
``
**setsetOnIn query.
sert"
```js
db.collection.update( <query>, { $setOnInsert: { <field1>: <value1>, ... } }, { upsert: true } )
db.products.update( { _id: 1 }, { $set: { item: "apple" }, $setOnInsert: { defaultQty: 100 } }, { upsert: true } )
```

**unset** query.

```js
{ $unset: { <field1>: "", ... } }
db.products.update( { sku: "unknown" }, { $unset: { quantity: "", instock: "" } } )
```

**currentDate** qyery.

```js
{ $currentDate: { <field1>: <typeSpecification1>, ... } }
db.users.update( { _id: 1 }, {
    $currentDate: { lastModified: true, "cancellation.date": { $type: "timestamp" }},
    $set: {status: "D", "cancellation.reason": "user request" }} )
```

**inc** query.

```js
{ $inc: { <field1>: <amount1>, <field2>: <amount2>, ... } }
db.products.update( { sku: "abc123" }, { $inc: { quantity: -2, "metrics.orders": 1 } } )
```

**mul** query.

```js
{ $mul: { <field1>: <number1>, ... } }
db.products.update( { _id: 1 }, { $mul: { price: NumberDecimal("1.25"), qty: 2 } } )
```

**min** query.

```js
{ $min: { <field1>: <value1>, ... } }
db.scores.update( { _id: 1 }, { $min: { lowScore: 150 } } )
```

**max** query.

```js
{ $max: { <field1>: <value1>, ... } }
db.scores.update( { _id: 1 }, { $max: { highScore: 950 } } )
```

**rename** query.

```js
{$rename: { <field1>: <newName1>, <field2>: <newName2>, ... } }
db.students.updateMany( {}, { $rename: { "nmae": "name" } } )
```

**update** query.

```js
{ _id: 4, "grades.grade": 85 }, { $set: { "grades.$.std" : 6 } }
```

**pull** query.

```js
{ $pull: { <field1>: <value|condition>, <field2>: <value|condition>, ... } }
db.survey.updateMany( { }, { $pull: { results: { score: 8 , item: "B" } } }, True)
```
