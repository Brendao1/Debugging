def encode(plaintext, key)
  p cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  # p prints out the key variable and shows that we've added the alphabet letters to it. So this one isn't a nil value
  # ciphertext_chars = plaintext.chars.map do |char|
    ciphertext_chars = plaintext.chars
    # this returns an array of characters. .chars method is similar to .split method
    ciphertext_chars = ciphertext_chars.map do |char|
      # (65 + cipher.find_index(char)).chr
      # it means something on the right hand side of a + is nil
      # therefore cipher is currently nil. Would need to instantiate the object with a non-nil value
      # <enumerator[then the string]:map>
      # it returns an enumerator object, which contains the string, which it is then trying to :map.
      # enumerator is a class. Mapping the enumerable will print out the digits, but will return nil. Actually, that's
      # not strictly true. We're chaining enumerable methods and one of the steps is returning nil.
      p cipher.find_index(char)
      # the last output for this operation is nil. So here is the error.
    p (65 + cipher.find_index(char)).chr # '+' nil can't be coerced into Integer TypeError
    # this prints out a letter for each elemet, but the error says error is 'block in encode'
    
  end
  ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  plaintext_chars.join
end

encode("theswiftfoxjumpedoverthelazydog", "secretkey")

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
