require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hash = HashMap.new

  string.chars.each do |char|
    if hash.include?(char)
      count = hash[char] + 1
      hash[char] = count
    else
      hash[char] = 1
    end
  end

  odds = 0

  hash.each do |buck|
    odds += 1 if buck[1] % 2 == 1
  end

  odds < 2

end
