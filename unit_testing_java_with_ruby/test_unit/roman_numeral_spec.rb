require 'rspec/given'
include Java

import com.testdouble.RomanNumeral

describe "Roman Numeral" do

  context "I -> 1" do
    When(:result) {RomanNumeral.from_string("I")}
    Then {result.should == 1}
  end

  context "II -> 2" do
    When(:result) {RomanNumeral.from_string("II")}
    Then {result.should == 2}
  end

  context "III -> 3" do
    When(:result) {RomanNumeral.from_string("III")}
    Then {result.should == 3}
  end

  context "IV -> 4" do
    When(:result) {RomanNumeral.from_string("IV")}
    Then {result.should == 4}
  end

  context "V -> 5" do
    When(:result) {RomanNumeral.from_string("V")}
    Then {result.should == 5}
  end

  context "X -> 10" do
    When(:result) {RomanNumeral.from_string("X")}
    Then {result.should == 10}
  end

  context "XIV -> 14" do
    When(:result) {RomanNumeral.from_string("XIV")}
    Then {result.should == 14}
  end

end