package org.klems.spark.example.components;

import java.util.ArrayList;
import java.util.List;

import j2html.tags.Tag;

public abstract class Block<B extends Block> {

  private final List<Block> children = new ArrayList<>();
  private Block parent;
  private Block root;

  public Block() {
    this.root = this;
  }
  
  public B add(Block child) {
    children.add(child);
    child.parent = parent;
    child.root = root;
    return (B) this;
  }

  public Block getRoot() {
    return root;
  }

  public List<Block> getChildren() {
    return children;
  }
  
  public abstract Tag getTag();
  
}
