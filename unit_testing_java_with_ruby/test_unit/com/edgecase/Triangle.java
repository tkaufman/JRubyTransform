package com.edgecase;

public class Triangle {
    private int a;
    private int b;
    private int c;

    public Triangle(int _a, int _b, int _c) {
        a = _a;
        b = _b;
        c = _c;
    }
    
    public String classify() {
        if (equilateral()) { return "equilateral"; }
        if (isosceles()) { return "isosceles"; }
        if (scalene()) { return "scalene"; }
        return "nil";
    }
    
    private boolean equilateral() {
        return ((a == b) && (b == c));
    }
    
    private boolean isosceles() {
        return ((a == b) || (b == c) || (a == c));
    }
    
    private boolean scalene() {
        return ((a != b) && (b != c) && (a != c) && (b != a));
    }

}