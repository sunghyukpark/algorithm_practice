package com.ankit

// Save element
class CustomHashMap<E>{
  private CustomHashMap<E, Object> customHashMap;

  // constructor
  public CustomHashMap(){
    customHashMap = new CustomHashMap<>();
  }

  public void add(E value){
    customHashMap.put(value, null)
  }

  public boolean contains(E obj){
    return customHashMap.contains(obj) != null? true:false;
  }

  public void display(){
    customHashMap.displaySet();
  }

  public boolean remove(E obj){
    customHashMap.remove(obj);
  }
}


// Save Key, Value pair
class CustomHashMap<K,V>{
  private Entry<K,V>[] table; //Array of entry
  private int capacity = 4; // Initial capacity of HashMap

  static class Entry<K,V>{
    K key;
    V value;
    Entry<K,V> next;

    public Entry(K key, V value, Entry<K,V> next){
      this.key = key;
      this.value = value;
      this.next = next;
    }
  }

  public CustomHashMap(){
    table = new Entry[capacity];
  }


  // key-value pair in CustomHashMap
  // If the map already contains mapping for the key -> replace
  // null key not allowed
  // null value allowed
  // provides how to override equals method
  // provides how to override hashCode method

  public void put(K newKey, V data){
    // check valid input
    if (newKey == null)
      return;

    // index of table - array of Elements
    // hash value of key
    int hash = hash(newKey);
    Entry<K,V> newEntry = new Entry<K,V>(newKey, data, null);

    if(table[hash] == null){
      table[hash] = newEntry;
    } else {
      Entry<K,V> previous = null;
      Entry<K,V> current = table[hash];

      while (current != null){
        if(current.key.equals(newKey)){
          if(previous == null){
            newEntry.next = current.next;
            table[hash] = newEntry;
            return;
          } else {
            previous.next = newEntry;
            newEntry.next = current.next;
            return;
          }
        }
        previous = current;
        current = current.next;
      }
      previous.next = newEntry;
    }
  }

  // Returns value of corresponding key
  public V get(K key){
    int hash = hash(key);

    // no such element
    if(table[hash] == null){
      return null;
    } else{
      Entry<K,V> temp = table[hash]
      while(temp != null){
        if(temp.key.equals(key))
          return temp.value;
        temp = temp.next;
      }
      return null;
    }
  }

  // Removes key-value pair from CustomHashMap
  public boolean remove(K deleteKey){
    int hash = hash[deleteKey];

    if (table[hash] == null){
      return false;
    } else {
      Entry<K,V> previous = null;
      Entry<K,V> current = table[hash];

      while(current != null){
        if(current.key.equals(deleteKey)){
          if(previous == null){
            table[hash] = table[hash].next;
            return true;
          }
          else {
            previous.next = current.next;
            return true;
          }
        }
        previous = current;
        current = current.next;
      }
      return false;
    }
  }

  // Displays all key-value pairs.
  public void display(){
    for(int i=0; i<capacity;i++){
      if(table[i]!=null){
        Entry<K,V> entry = table[i];
        while(entry!=null){
          System.out.print("{" + entry.key + "=" + entry.value + "}" + " ");
          entry = entry.next;
        }
      }
    }
  }

  // Method returns null if set does not contain object.
  public K contains(K key){
    int hash = hash(key);
    if(table[hash] == null){
      return null;
    } else {
      Entry<K,V> temp = table[hash];
      while(temp!= null){
        if(temp.key.equals(key))
          return key;
        temp = temp.next; //return value corresponding to key.
      }
      return null; // returns null if key is not found
    }
  }

  // displays all objects in setCustom
  public void displaySet(){
    for(int i=0;i<capacity;i++){
      if(table[i] != null){
        Entry<K,V> entry = table[i];
        while(entry != null){
          System.out.print(entry.key + " ");
          entry = entry.next;
        }
      }
    }
  }



  private int hash(K key){
    return Math.abs(key.hashCode()) % capacity;
  }


}