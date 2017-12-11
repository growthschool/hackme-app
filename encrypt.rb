

require 'json'
require 'base64'
require 'openssl'

puts OpenSSL::Cipher.ciphers

key = OpenSSL::Random.random_bytes(8)

text = { message: 'this is secret' }.to_json
cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

cipher.key = 'ThisPasswordIsReallyHardToGuess!'

encrypted = cipher.update(text) + cipher.final

puts encrypted
