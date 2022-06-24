# run-tests

POSIX shell testing framework.

## Installing

```
$ make install
```

## Usage

Create a directory named `./tests` and add as many shell scripts as you like.
The second line of the script will be shown on run-tests's output as the
description of the test.

```sh
#!/bin/sh
# Print hello

echo hello
```

then:

```term
$ run-tests
 FAIL   First test
 FAIL   Second test
 PASS   Print hello

Ran 3 tests, 1 passed, 2 failed (33% pass).
```

