# Enigma
Turing Back End Engineering: Mod 1 final project, [Enigma](https://backend.turing.io/module1/projects/enigma/index)

[Process gist here!](https://gist.github.com/gabichuelas/5f25b5f6919d041ada786aba798c5edb)

## How to Use ##
Clone repo down, and use CL arguments to `encrypt`, `decrypt`, and `crack` messages.

```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
```
Where `message.txt` is the only file you are manually creating beforehand. A key will be randomly generated, and the date will be the day the command is run. Resulting encoded message will be saved in `encrypted.txt`

```
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt key date
```
Keys are 5 characters, dates are 6 (ddmmyy).
Decrypted text will be saved in `decrypted.txt`

```
$ ruby ./lib/crack.rb encrypted.txt cracked.txt date
```
Creates `cracked.txt` file with decrypted text from the `encrypted.txt` file.

## Self-Evaluation ##
[Project Rubric](https://backend.turing.io/module1/projects/enigma/rubric)
### Functionality -- 4 ###
Got through all functionality, including the `Enigma#crack` method and the corresponding CLI interface.

After some painstaking debugging, I discovered that the autosave function on Atom was adding a newline character to the end of my encrypted message text files, which was throwing off the algorithm for `#crack`. I fixed it with a `chomp!` at the end of the method that produced the message.

Before getting to this point, it was a long journey to figure out the `#crack` method. I'd hit a wall after I was able get the method to crack the encrypted text, without using a date _or_ a key, but was unable to get it to produce said **key**.

Eventually I returned to my original idea, which was to employ brute force (yay computational power!). _Thanks, @timomitchel_ This worked, after I implemented it properly, of course (ha!).

### OOP -- 3.5? ###
This is the category I probably have the most difficulty with because I don't have enough experience to tell if my design choices _actually_ make sense in the grand scheme of things, although I can explain them.

For this project, I created 4 classes: `EnigmaRunner, Enigma, Cipher, and Key`.

 * `EnigmaRunner` holds all the File I/O work that makes the CL interface work. It inherits from `Enigma` in order to access the `#encrypt, #decrypt, and #crack` methods.

 * `Enigma` holds the three main methods mentioned above, which call on the parent class `Cipher` to access the methods that actually do the character shifting and key cracking. The methods in `Enigma` return the required hash with info for each cipher.

 * `Enigma` inherits from `Cipher` because it is a type of cipher. The shifting methods found in `Cipher` could be hypothetically used for other ciphers.

 * `Cipher` employs the use of the `Encryptable` module, who's only function is to prepare the given data (message provided, key, and date) for encryption, decryption, or cracking. Again, these prep methods could be used for a variety of hypothetical cipher classes.

 * The `Encryptable` module makes use of the `Key` class to create a random key (in case one is not provided), and generate today's date in the required format (if a date is not provided). It's also in charge of divvying up the given message into arrays of 4 characters each, for ease of translation. Finally, this is also the place where the **shifts** used are created using _key_ and _date_ info.

 * The `Key` class is small, but is in charge of holding an array of strings representing possible keys from `"00000"` to `"99999"`. `Key::make` samples this array to generate a random key. As that array is stored in a constant, `NUMS`, we can access it from the `Cipher` class (via `Encryptable`) to iterate through when forcibly cracking unknown keys.

### Ruby Conventions / Mechanics -- 4 ###
The designer in me likes to make empty lines are placed where they make sense... :)

All methods are under 10 lines (I think the longest is 8).

All methods in `Cipher` were refactored multiple times to ensure simplicity and reduce redundancy where possible.

Of particular note (in my _newb_ opinion) is where I used `each_with_index` to iterate over an array of ranges corresponding to the indices of a given key. (This is in `Encryptable`) I was able to take the index corresponding to a particular range to create a hash that held the **shifts** for that particular key/date combo. The indices `0..3` were converted to strings and used as keys in said hash, and corresponded to `a..d` "shifts".

I also used `#rotate` and `#zip` for my original `#crack` method that would decrypt a message without a key or date. That method survives in the process [gist](https://gist.github.com/gabichuelas/5f25b5f6919d041ada786aba798c5edb) I kept throughout the project.

### TDD -- 3-4 ###
I used TDD to create the `Enigma`, `Cipher`, and `Key` classes. Spec sheet said we didn't have to test our CLI methods, and because of this, I chose not to create a `EnigmaRunner` test file. I did try using mocks/stubs at first to make this test file work, but I found my efforts weren't really worthwhile, IMO.

I _did_ use **stubs** in my `Key` tests, however, and **Simplecov** shows `100%` coverage.

Not sure if this category should be a 3 or 4 as I'm unclear about the whole CLI testing situation.

### Version Control -- 4 ###
**67** commits, **12** branches, and **13** PR's. I also left myself process/change summary comments on most PR's (for documentation). Branches were separated by major features/functionality.
