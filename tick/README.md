# tick

POSIX shell testing framework.

## Installing

```
$ make install
```

## Usage

Create a directory named `./tests` and add as many shell scripts as you like.
The second line of the script will be shown on tick's output as the description
of the test.

```bash
#!/bin/sh
# Print hello

echo hello
```

then:

```
$ tick
 FAIL   First test
 FAIL   Second test
 PASS   Print hello

Ran 3 tests, 1 passed, 2 failed (33% pass).
```

