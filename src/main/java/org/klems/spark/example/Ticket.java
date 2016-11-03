package org.klems.spark.example;

class Ticket {

  private String id;
  private Status status;
  private String set;
  private Seat seat;

  public String getId() {
    return id;
  }

  public Status getStatus() {
    return status;
  }

  public String getSet() {
    return set;
  }

  public Seat getSeat() {
    return seat;
  }

  public static enum Status {

    VACANT, SOLD, RESERVED;
    
  }

  public static class Seat {

    private int row;
    private int number;
    private String sector;

    public int getRow() {
      return row;
    }

    public int getNumber() {
      return number;
    }

    public String getSector() {
      return sector;
    }
    
  }
  
}
