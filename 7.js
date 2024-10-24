Here’s your content formatted properly under the section for **Python and MongoDB**:

### 7. Python and MongoDB

#### a. Connecting Python with MongoDB and Inserting, Retrieving, Updating, and Deleting

**Inserting:**
```python
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db = client.MyDb

def insert():
    try:
        name1 = input("Enter the name: ")
        age1 = input("Enter the age: ")
        db.MyCol.insert_one({
            "name": name1,
            "age": age1
        })
        print("Inserted data successfully")
    except Exception as e:
        print("Error:", str(e))

insert()
```

**Save the file as `insert.py`.**

**In Command Prompt:**
1. First, start `mongod`:
   ```bash
   C:\Program Files\MongoDB\Server\4.2\bin> mongod
   ```
2. In another Command Prompt, start `mongo`:
   ```bash
   C:\Program Files\MongoDB\Server\4.2\bin> mongo
   ```
3. Show databases:
   ```bash
   > show dbs
   admin        0.000GB
   college      0.000GB
   MyDb         0.000GB
   ```
4. Switch to `MyDb`:
   ```bash
   > use MyDb
   ```
5. Show collections:
   ```bash
   > show collections
   MyCol
   ```
6. Find all documents:
   ```bash
   > db.MyCol.find()
   { "_id" : ObjectId("66d5880e3546e3dc4f223d57"), "name" : "Adshaya", "age" : "19" }
   ```

---

**Retrieving:**
```python
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db = client.MyDb

def read():
    try:
        col = db.MyCol.find()
        print("\nAll data from student Database:\n")
        for my_col in col:
            print(my_col)
    except Exception as e:
        print("Error:", str(e))

read()
```

**Output:**
```
All data from student Database
{'_id': ObjectId('66d5880e3546e3dc4f223d57'), 'name': 'Adshaya', 'age': '19'}
```

---

**Updating:**
```python
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db = client.MyDb

def update():
    try:
        name1 = input("Enter name to update: ")
        age1 = input("Enter age to update: ")
        db.MyCol.update_one(
            {"name": name1},
            {"$set": {"age": age1}}
        )
        print("\nUpdated data successfully")
    except Exception as e:
        print("Error:", str(e))

update()
```

**Show collections and find updated document:**
```bash
> show collections
MyCol
> db.MyCol.find()
{ "_id" : ObjectId("66d5880e3546e3dc4f223d57"), "name" : "Adssss", "age" : "18" }
```

---

**Deleting:**
```python
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db = client.MyDb

def delete():
    try:
        name1 = input("Enter name: ")
        db.MyCol.delete_one({"name": name1})
        print("\nDeletion successful\n")
    except Exception as e:
        print("Error:", str(e))

delete()
```

**Output:**
```
Enter name: nm
Deletion successful
```

**Show databases:**
```bash
> show dbs
admin        0.000GB
college      0.000GB
myDb         0.000GB
```

**Switch to `MyDb`:**
```bash
> use MyDb
```

**Show collections:**
```bash
> show collections
MyCol
> db.MyCol.find()
{ "_id" : ObjectId("66cc2e5f64a53b621cb738d8"), "name" : "nm", "age" : "3" }
```

**Final Note:**
```bash
> db.MyCol.find()  # (This indicates the document has been deleted)
```

Feel free to ask if you need any more modifications or details!
