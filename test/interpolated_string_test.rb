require './test/helper'

class InterpolatedStringTest < Test::Unit::TestCase
  context "inheritance" do
    should "inherited from String" do
      assert InterpolatedString.new("paperclip").is_a? String
    end
  end

  context "#escape" do
    subject { InterpolatedString.new("paperclip foo").escape }

    should "returns an InterpolatedString object" do
      assert subject.is_a? InterpolatedString
    end

    should "escape the output string" do
      assert_equal "paperclip%20foo", subject
    end

    should "not double escape output string" do
      assert_equal "paperclip%20foo", subject.escape
    end
  end

  context "#unescape" do
    subject { InterpolatedString.new("paperclip%20foo").escape.unescape }

    should "returns an InterpolatedString object" do
      assert subject.is_a? InterpolatedString
    end

    should "unescape the output string" do
      assert_equal "paperclip%20foo", subject
    end

    should "not double unescape output string" do
      assert_equal "paperclip%20foo", subject.unescape
    end
  end

  context "#escaped?" do
    subject { InterpolatedString.new("paperclip") }

    should "returns true if string was escaped" do
      assert subject.escape.escaped?
    end

    should "returns false if string wasn't escaped" do
      assert !subject.escaped?
    end
  end

  context "#to_s" do
    subject { InterpolatedString.new("paperclip").to_s }

    should "returns a String object" do
      assert subject.is_a? String
    end
  end
end
