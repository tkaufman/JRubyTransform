package com.testdouble;

import java.util.Map;
import java.util.HashMap;

public class RomanNumeral {

  public static int fromString(String roman) {

    Map<Character, Integer> charMap = buildCharMap();

    int result = 0;
    int current = 0;
    int previous = Integer.MAX_VALUE;
    char[] romanChars = roman.toCharArray();
    for (char c : romanChars) {
      current = charMap.get(c);
      if (previous < current) {
        result -= previous;
        result += (current - previous);
      }
      else {
        result += current;
      }
      previous = current;
    }
    return result;
  }

  private static Map<Character, Integer> buildCharMap() {
    Map<Character, Integer> charMap = new HashMap<Character, Integer>();
    charMap.put('I',1);
    charMap.put('V',5);
    charMap.put('X',10);
    return charMap;
  }
}