class Wapuro
  attr_accessor :translation

  def initialize(romaji)
    @romaji = romaji
    @translation = ''
  end

  def translate
    raise RuntimeError, 'Must be a string' unless is_valid_input?

    @romaji.split(' ').each do |romaji|
      char_index = 0

      while char_index < romaji.length do
        step_ahead_counter = 3

        while step_ahead_counter > 0 do
          hiragana = CHARS[romaji.slice(char_index, step_ahead_counter)]

          if hiragana
            @translation += hiragana
            char_index += step_ahead_counter
            break
          end

          step_ahead_counter -= 1
          raise "Invalid entry" if step_ahead_counter == 0
        end
      end
    end

    @translation
  end

  def is_valid_input?
    @romaji.class == String
  end

  CHARS = {
    "n" => "ん",
    "a" => "あ",
    "i" => "い",
    "u" => "う",
    "e" => "え",
    "o" => "お",
    "ka" => "か",
    "ki" => "き",
    "ku" => "く",
    "ke" => "け",
    "ko" => "こ",
    "sa" => "さ",
    "shi" => "し",
    "su" => "す",
    "se" => "せ",
    "so" => "そ",
    "ta" => "た",
    "chi" => "ち",
    "tsu" => "つ",
    "te" => "て",
    "to" => "と",
    "na" => "な",
    "ni" => "に",
    "nu" => "ぬ",
    "ne" => "ね",
    "no" => "の",
    "ha" => "は",
    "hi" => "ひ",
    "fu" => "ふ",
    "he" => "へ",
    "ho" => "ほ",
    "ma" => "ま",
    "mi" => "み",
    "mu" => "む",
    "me" => "め",
    "mo" => "も",
    "ya" => "や",
    "yu" =>"ゆ",
    "yo" =>"よ",
    "ra" =>"ら",
    "ri" =>"り",
    "ru" =>"る",
    "re" =>"れ",
    "ro" =>"ろ",
    "wa" =>"わ",
    "wi" =>"ゐ",
    "we" =>"ゑ",
    "wo" =>"を",
    "ga" =>"が",
    "gi" =>"ぎ",
    "gu" =>"ぐ",
    "ge" =>"げ",
    "go" =>"ご",
    "za" =>"ざ",
    "ji" =>"じ",
    "zu" =>"ず",
    "ze" =>"ぜ",
    "zo" =>"ぞ",
    "da" =>"だ",
    "di" =>"ぢ",
    "du" =>"づ",
    "de" =>"で",
    "do" =>"ど",
    "ba" =>"ば",
    "bi" =>"び",
    "bu" =>"ぶ",
    "be" =>"べ",
    "bo" =>"ぼ",
    "pa" =>"ぱ",
    "pi" =>"ぴ",
    "pu" =>"ぷ",
    "pe" =>"ぺ",
    "po" =>"ぽ",
  }
end
