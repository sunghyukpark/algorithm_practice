import java.util.TreeSet;
import java.util.LinkedHashSet;
import java.util.HashSet;
import java.util.Set;

public class App {


  public static void main(String[] args){
    // Hash set does not retain order
    // Set<String> set1 = new HashSet<String>();

    // LinkedHashSet remembers the order you added
    // Set<String> set1 = new LinkedHashSet<String>();

    // in alpha order
    Set<String> set1 = new TreeSet<String>();

    set1.add("dog");
    set1.add("cat");
    set1.add("mouse");
    set1.add("snake");
    set1.add("bear");

    // Adding duplicate items does nothing
    set1.add("mouse");

    System.out.println(set1);

    // iteration
    for(String element: set1){
      System.out.println(element);
    }

    // contains?
    if (set1.contains("cat")){
      System.out.println("Contains cat");
    }

    if (set1.contains("fdaafd")){
      System.out.println("Contains fdaafd");
    }

    // Intersection
    Set<String> set2 = new TreeSet<String>();
    set2.add("dog");
    set2.add("cat");
    set2.add("horse");

    Set<String> intersection = new HashSet<String>(set1);
    intersection.retainAll(set2);

    System.out.println(intersection);


    // Difference
    Set<String> difference = new HashSet<String>(set1);
    difference.removeAll(set2);
    System.out.println(difference);


  }
}