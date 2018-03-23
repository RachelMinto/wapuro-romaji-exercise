require 'minitest/autorun'
require_relative 'wapuro'

class WapuroTest < Minitest::Test
  def test_single_char_input
    assert_equal "ん", Wapuro.new("n").translate
  end

  def test_multiple_char_input
    assert_equal "こんにちは", Wapuro.new("konnichiha").translate
  end

  def test_kana_no_space
    assert_equal "かな", Wapuro.new("kana").translate
  end

  def test_kan_a_with_space
    assert_equal "かんあ", Wapuro.new("kan a").translate
  end

  def test_with_invalid_input
    assert_raises RuntimeError, "Must be a string" do
      Wapuro.new(1234).translate
    end
  end

  def test_oyasuminasai
    assert_equal "おやすみなさい", Wapuro.new("oyasuminasai").translate
  end

  def test_yoroshiku_ne
    assert_equal "よろしくね", Wapuro.new("yoroshiku ne").translate
  end

  def test_empty_input
    assert_equal "", Wapuro.new("").translate
  end

  def test_invalid_letter
    assert_raises StandardError, "Invalid Entry" do
      Wapuro.new("exodia").translate
    end
  end

  def test_invalid_entry
    assert_raises StandardError, "Invalid Entry" do
      Wapuro.new("cheese").translate
    end
  end
end