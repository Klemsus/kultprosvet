package org.klems.spark.example.data;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.field.ForeignCollectionField;
import com.j256.ormlite.table.DatabaseTable;
import java.util.Collection;
import java.util.Date;

@DatabaseTable(tableName = "events")
public class Event {
  
  @DatabaseField(generatedId = true)
  private long id;
  
  @DatabaseField(canBeNull = false, index = true)
  private String name;

  @DatabaseField(canBeNull = false)
  private String poster;
  
  @DatabaseField(canBeNull = false)
  private String anons;
  
  @ForeignCollectionField
  private Collection<EventGenres> genres;
  
  @DatabaseField
  private int age;
  
  @DatabaseField(canBeNull = false)
  private Date date;
  
  @DatabaseField(canBeNull = false)
  private String location;

  public long getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getPoster() {
    return poster;
  }

  public String getAnons() {
    return anons;
  }

  public Collection<EventGenres> getGenres() {
    return genres;
  }

  public int getAge() {
    return age;
  }

  public Date getDate() {
    return date;
  }

  public String getLocation() {
    return location;
  }
  
}
