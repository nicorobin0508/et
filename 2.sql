Here are the practical MongoDB commands organized under appropriate questions:

### Practical No. 2

1. **What databases are available in the MongoDB server?**
   ```bash
   show dbs
   ```

2. **How do you switch to the `restaurants` database?**
   ```bash
   use restaurants
   ```

3. **How can you find all documents in the `rest` collection?**
   ```bash
   db.rest.find()
   ```

4. **How do you retrieve specific fields (restaurant_id, name, borough, cuisine) from all documents?**
   ```bash
   db.rest.find({}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1})
   ```

5. **How can you find specific fields but exclude the `_id` field?**
   ```bash
   db.rest.find({}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1, "_id": 0})
   ```

6. **How do you retrieve the restaurant_id, name, borough, and address.zipcode fields?**
   ```bash
   db.rest.find({}, {"restaurant_id": 1, "name": 1, "borough": 1, "address.zipcode": 1})
   ```

7. **How can you limit the number of results returned and format them nicely?**
   ```bash
   db.rest.find().limit().pretty()
   ```

8. **How do you find the first 10 restaurants in the Bronx?**
   ```bash
   db.rest.find({"borough": "Bronx"}, {"restaurant_id": 1, "name": 1}).limit(10)
   ```

9. **How can you skip the first 5 restaurants in the Bronx and show the next 10?**
   ```bash
   db.rest.find({"borough": "Bronx"}, {"restaurant_id": 1, "name": 1}).limit(10).skip(5)
   ```

10. **How do you find restaurants with a grade score greater than 90?**
    ```bash
    db.rest.find({"grades.score": {"$gt": 90}})
    ```

11. **How can you find restaurants with coordinates less than -95.754168?**
    ```bash
    db.rest.find({"address.coord": {"$lt": -95.754168}}, {"name": 1})
    ```

12. **How do you find restaurants that are not American cuisine, have a score greater than 70, and coordinates less than -65.754168?**
    ```bash
    db.rest.find({
        "$and": [
            {"cuisine": {"$ne": "American"}},
            {"grades.score": {"$gt": 70}},
            {"address.coord": {"$lt": -65.754168}}
        ]
    })
    ```

13. **How can you find restaurants that are not American cuisine, have coordinates less than 65.754168, and grades score greater than 70?**
    ```bash
    db.rest.find({
        "cuisine": {"$ne": "American"},
        "address.coord": {"$lt": 65.754168},
        "grades.score": {"$gt": 70}
    })
    ```

14. **How do you find restaurants with grade "A" that are not in Brooklyn?**
    ```bash
    db.rest.find({
        "cuisine": {"$ne": "American"},
        "grades.grade": "A",
        "borough": {"$ne": "Brooklyn"}
    }).sort({"cuisine": -1}).pretty()
    ```

15. **How can you find restaurants whose names start with "Wil"?**
    ```bash
    db.rest.find({"name": /^Wil/}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1})
    ```

16. **How do you find restaurants whose names end with "ces"?**
    ```bash
    db.rest.find({"name": /ces$/}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1})
    ```

17. **How can you find restaurants whose names contain "Reg"?**
    ```bash
    db.rest.find({"name": /.*Reg.*/}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1})
    ```

18. **How do you find restaurants in the Bronx that serve either American or Chinese cuisine?**
    ```bash
    db.rest.find({
        "borough": "Bronx",
        "$or": [
            {"cuisine": "American"},
            {"cuisine": "Chinese"}
        ]
    }).pretty()
    ```

19. **How can you find restaurants located in Staten Island, Queens, Bronx, or Brooklyn?**
    ```bash
    db.rest.find({"Borough": {"$in": ["StatenIsland", "Queens", "Bronx", "Brooklyn"]}}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1})
    ```

Feel free to modify any questions or add more if needed!
