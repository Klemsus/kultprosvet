package org.klems.spark.example;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.gson.annotations.SerializedName;

public class Event {

  private String lifetime;
  
  private String id;
  
  private Title title;
  
  private List<String> tags;
  
  private Media media;
  
  private Venue venue;
  
  private List<Set> sets;
  
  @SerializedName("tickets_amount_vacant")
  private Integer tickets_vacant;
  
  @SerializedName("age_rating")
  private Integer age;

  public List<Set> getSets() {
    return sets;
  }

  public Integer getTickets_vacant() {
    return tickets_vacant;
  }
  
  public Date getDate() {
    Matcher matcher = Pattern.compile("DTSTART;VALUE=DATE-TIME:(\\d+T\\d+Z)").matcher(lifetime);
    matcher.find();
    try {
      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd'T'HHmmss");
      simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
      return simpleDateFormat.parse(matcher.group(1));
    } catch (ParseException ex) {
      throw new IllegalStateException(ex);
    }
  }  
  
  public Integer getAge() {
    return age;
  }

  public String getId() {
    return id;
  }

  public Title getTitle() {
    return title;
  }

  public List<String> getTags() {
    return tags;
  }

  public Media getMedia() {
    return media;
  }

  public Venue getLocation() {
    return venue;
  }

  public static class Title {

    private String text;
    private String desc;

    public String getText() {
      return text.replaceFirst("^\\d+/\\d+", "").replaceFirst("@.*?$", "").trim();
    }

    public String getDesc() {
      return desc;
    }
    
  }

  public static class Media {
    
    private Cover cover;

    public Cover getCover() {
      return cover;
    }
    
  }

  public static class Cover {

    private String id;
    private Integer length;
    private String url;

    public String getId() {
      return id;
    }

    public Integer getLength() {
      return length;
    }

    public String getUrl() {
      return url;
    }

  }

  public static class Venue {

    private Point point;
    private String id;
    private String address;
    private String name;

    public Point getPoint() {
      return point;
    }

    public String getId() {
      return id;
    }

    public String getAddress() {
      return address;
    }

    public String getName() {
      return name;
    }

  }

  public static class Point {

    private List<Double> coordinates;

    public List<Double> getCoordinates() {
      return coordinates;
    }
    
  }

  public static class Set {
    
    private String id;
    private int pos;
    private String name;
    private int amount;
    private int amount_vacant;
    private double price;
    //private List<Rule> rules;

    public String getId() {
      return id;
    }

    public int getPos() {
      return pos;
    }

    public String getName() {
      return name;
    }

    public int getAmount() {
      return amount;
    }

    public int getAmount_vacant() {
      return amount_vacant;
    }

    public double getPrice() {
      return price;
    }
    
  }

  public static class Rule {

    private String id;
    private boolean current;
    private double price;
    
  }
  
}
