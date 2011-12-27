package com.edgecase;

public class Triangle {
    int a;
    int b;
    int c;

    public Triangle(int _a, int _b, int _c) {
        a = _a;
        b = _b;
        c = _c;
    }
    
    public String classify() {
        if ((a == b) && (b == c)) {
            return "equilateral";
        }
        if ((a == b) || (b == c) || (a == c)) {
            return "isosceles";
        }
        return "scalene";
    }

}