def encode(plaintext, key)
  p cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  # p prints out the key variable and shows that we've added the alphabet letters to it. So this one isn't a nil value
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr # '+' nil can't be coerced into Integer TypeError
    # it means something on the right hand side of a + is nil
    # therefore cipher is currently nil. Would need to instantiate the object with a non-nil value
    # check the value of cipher uing p
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
