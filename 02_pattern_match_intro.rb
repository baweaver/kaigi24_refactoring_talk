array = [1, 2.0, "String", 2.0, 3]
array in [_, Numeric => n, /^S/, ^n, *]
# => true

n
# => 2.0

# Find pattern
other_array = [1, 2, 'a', 3, 'b', 4, 5]
other_array in [*, 'a', *]
# => true

# Expression pattern
[1, 2, 3] in [Integer => n, ^(n + 1), ^(n + 2)]
# => true

# Further reading: https://dev.to/baweaver/definitive-pattern-matching-array-like-structures-1298
