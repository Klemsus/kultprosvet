package org.klems.spark.example.data;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName = "eventgenres")
public class EventGenres {
  
  @DatabaseField(foreign = true)
  private Event event;
  
  @DatabaseField(foreign = true)
  private Genre genre;

}
