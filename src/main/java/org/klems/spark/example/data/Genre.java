package org.klems.spark.example.data;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName = "genres")
public class Genre {
  
  @DatabaseField(id = true, uniqueIndex = true)
  private String name;
  
  @DatabaseField(canBeNull = false)
  private String humanName;

}
