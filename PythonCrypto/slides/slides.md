title: Python Cryptography Lab
output: index.html
theme: sudodoki/reveal-cleaver-theme
controls: true

--

# Python Cryptograph Lab

--

### Repl.it

Goto https://repl.it

--

### Hello World

```python
print("Hello World")
```

--

### ROT13

We want to encode

	Why did the chicken cross the road?

into

	Jul qvq gur puvpxra pebff gur ebnq?

and decode it back.

--

### ROT13 for Char

Write a Python function that can ROT13 encode a single character.

```python
def rot13char(char):
    pass
```

--

### ROT13 for Char

It should encode upper case letter into upper case letter.

```python
assert(rot13char('W') == 'J')
```

--

### ROT13 for Char

It should encode lower case letter into lower case letter.

```python
assert(rot13char('h') == 'u')
```

--

### ROT13 for Char

It should NOT encode other *characters* like white space or question mark.

```python
assert(rot13char(' ') == ' ')
assert(rot13char('?') == '?)
```

--

### ROT13 for Char: Hint 0

DO NOT use the lookup table as in the Wikipedia page. It will **not** *scale*
for later exercises. Use your brain not labor.

--

### ROT13 for Char: Hint 1

You will need the following Python language features

1. ```if ... else``` statement

2. Several method of the Char class for finding out if a character is
an alphabet and if is it an upper or lower case alphabet.

-- 
### ROT13 for Char: Hint 2

```python
def rot13char(char):
    if (char.isaplha()):
        # do something for alphabets
        if (char.islower()):
            # encode lower case alphabets into lower case alphabets
        else:
            # encode upper case alphabets into upper case alphabets
    else:
        # do other thing for non-alphabet
```
--

### ROT13 for Char: Hint 3

1. Turning a character into ASCII code with ```ord``` and turning it back
with ```chr```.

2. How to you "wrap around" numbers back to less than 26 after added 13 to it?

--

### ROT13 for Char: Sample Solution

```python
def rot13char(char):
    if (char.isaplha()):
        # do something for alphabets
        if (char.islower()):
            # encode lower case alphabets into lower case alphabets
            code = ord(char) - ord('a')
            code = (code + 13) % 26
            return chr(code + ord('a'))
        else:
            # encode upper case alphabets into upper case alphabets
            code = ord(char) - ord('A')
            code = (code + 13) % 26
            return chr(code + ord('A'))
    else:
        # do other thing for non-alphabet
        return char
```

--

### ROT13 for String

```python
assert(rot13("Why did the chicken cross the road?") == \
    "Jul qvq gur puvpxra pebff gur ebnq?")
assert(rot13("Jul qvq gur puvpxra pebff gur ebnq?") == \
    "Why did the chicken cross the road?")
```

--

### ROT13 for String: Hint 0

1. How can we build the output one character by one character?
2. How can we go through each character in the string?

--

### ROT13 for String: Hint 1

Try

```python
'a' + 'b' + 'c'
```

and try

```python
for ch in "abcd":
    print(ch)
```

--

### ROT13 for String: Sample Solution
```python
def rot13(input):
    output = ""
    for ch in input:
        output += str(rot13char(ch))
    return output
```

--

### ROTn for Char

1. Reuse ```rot13char(char)``` to come up with ```rotnchar(char, n)```
2. Verify that your ```rotnchar(char, n)``` is the same as ```rot13char(char)```
when ```n = 13```.
3. Think about test cases for ```n != 13```.

--

### ROTn Decoding

1. ROTn is not a symmetry encoder so
```rotnchar(rotnchar('a', n), n) != 'a')```.

2. Find the relationship between (m, n) such that
```rotnchar(rotnchar('a', n), m) == 'a'```.

--

### ROTn for String

1. Reuse ```rot13(str)``` to implement ```rotn(str, n)```.

2. Again, verify that ```rotn(str, 13) == rot13(str)```.

3. Figure out a test case to encode and decode a message.

--

### Frequency Analysis

* ROTn has NO security and can be easily cracked by *brute force* or
*frequency analysis*.

* Python provides the ```Counter``` class from the ```collections``` package
that makes frequency analysis very easy.

```python
from collections import Counter

Counter("Hello World")
```

--

### Frequency Analysis

Try decode the following secrete message:

	Qeb nrfzh yoltk clu grjmp lsbo qeb ixwv ald
