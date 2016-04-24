package org.klems.spark.example.data;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName = "locations")
public class Location {
  
  @DatabaseField(generatedId = true)
  private int id;
  
  @DatabaseField(canBeNull = false)
  private String name;

}
