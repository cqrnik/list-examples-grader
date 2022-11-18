import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.*;

public class TestListExamples {

  @Test
  public void testMerge() {
    List<String> input1 = new ArrayList<String>();
    List<String> input2 = new ArrayList<String>();

    input1.add("apple");
    input1.add("child");
    input1.add("ears");
    input1.add("grape");

    input2.add("bear");
    input2.add("energy");
    input2.add("fan");
    input2.add("zebra");

    List<String> output1 = ListExamples.merge(input1, input2);
    List<String> output2 = new ArrayList<String>();

    output2.add("apple");
    output2.add("bear");
    output2.add("child");
    output2.add("ears");
    output2.add("energy");
    output2.add("fan");
    output2.add("grape");
    output2.add("zebra");

    assertEquals(8, output1.size());
    assertEquals(output1, output2);

  }

  @Test
  public void testMergeOneString() {
    List<String> input1 = new ArrayList<String>();
    List<String> input2 = new ArrayList<String>();

    input1.add("apple");

    List<String> output1 = ListExamples.merge(input1, input2);
    List<String> output2 = new ArrayList<String>();

    output2.add("apple");

    assertEquals(1, output1.size());
    assertEquals(output1, output2);

  }

  @Test
  public void testMergeOne() {
    List<String> input1 = new ArrayList<String>();
    List<String> input2 = new ArrayList<String>();

    input2.add("apple");

    List<String> output1 = ListExamples.merge(input1, input2);
    List<String> output2 = new ArrayList<String>();

    output2.add("apple");

    assertEquals(1, output1.size());
    assertEquals(output1, output2);

  }

}
