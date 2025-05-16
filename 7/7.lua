local nth_primes = require('../common/nth_primes')

local table = nth_primes(10001)

print(table[#table])
