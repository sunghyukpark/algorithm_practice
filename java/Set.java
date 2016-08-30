// 1. add()
// 2. clear()
// 3. contains()
// 4. isEmpty()
// 5. iterator()
// 6. remove()
// 7. size()

// Basic Operations
// int size()                        // Returns the number of elements of this Collection
// void clear()                      // Removes all the elements of this Collection
// boolean isEmpty()                 // Returns true if there is no element in this Collection
// boolean add(E element)            // Ensures that this Collection contains the given element
// boolean remove(Object element)    // Removes the given element, if present
// boolean contains(Object element)  // Returns true if this Collection contains the given element

// Bulk Operations with another Collection
// boolean containsAll(Collection<?> c)       // Collection of any "unknown" object
// boolean addAll(Collection<? extends E> c)  // Collection of E or its sub-types
// boolean removeAll(Collection<?> c)
// boolean retainAll(Collection<?> c)

// Comparison - Objects that are equal shall have the same hashCode
// boolean equals(Object o)
// int hashCode()

// Array Operations
// Object[] toArray()       // Convert to an Object array
// <T> T[] toArray(T[] a)   // Convert to an array of the given type T


import java.util.Collection;
import java.util.iterator;

public class CustomSet{
  private CustomSet<String> customSet;

  public CustomSet(){
    CustomSet<String> customSet = new CustomSet<String>();
  }

  public boolean add(E element){
    customSet.add(element);
  }

  public void clear(){
    customSet.clear();
  }

  public boolean contains(Object element){
    customSet.contains(element);
  }

  public boolean isEmpty(){
    customSet.isEmpty();
  }

  public Iterator<String> iterator(){
    Iterator<String> iterator = new Iterator<>();
    return iterator;
  }

  public boolean remove(Object element){
    customSet.remove(element);
  }

  public int size(){
    customSet.size();
  }

  public static void main(String[] args){

  }
}