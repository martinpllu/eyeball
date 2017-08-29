# eyeball

eyeball is a tiny bash script that helps you detect and understand changes in a program's output. It can be used as a cheap and 
cheerful alternative to writing test code.

# Quick start

```
# Run a test of your program (noodles.py --extra-soy) for the first time, 
# recording the output (stdout+stderr) in noodles.out as well as displaying
# it on your console.
# 
# Remember the double quotes around your command if it contains spaces!

eyeball "python noodles.py --extra-soy" noodles.out

# Run the test again (usually afer a code change is made) using the same command as above.
# If the new output exactly matches the baseline output, eyeball reports a PASS.
# Otherwise, eyeball reports a FAIL and displays a diff between the new and baseline output, 
# and the new output is stored in noodles.out.eyeball.

# If the difference in output is expected, you can update the baseline:

eyeball --update noodles.out

# Otherwise, fix the bug in noodles.py and try again!
```

# Installation

To install, simply copy the `eyeball` script somehere on your PATH, e.g. `/usr/local/bin`.

# Diff command

- If `git` is installed, `eyeball` uses `git --no-pager diff --color-words --no-index` to generate a lovely colourised word-by-word diff report.
- If `git` is not installed, `eyeball` uses plain old `diff`.
- The diff command can be customised by setting the `EYEBALL_DIFF` environment variable, e.g. `export EYEBALL_DIFF=colordiff`

# Notes and tips

- The output of your program needs to be deterministic for an eyeball test to work. Hopefully you can control the output 
in most circumstances (seeding dates, random number generators etc). However if you need to do further processing on the output you can 
pipe it to `sed` or `awk` for example: `eyeball "blah.sh | sed sed 's/date is .*/date is DATE/'" blah.out`
- If your program writes output to file(s), simply output the file contents as part of the command, e.g. 
`eyeball "gen-stuff.sh; cat stuff1.json; cat stuff2.txt" gen-stuff.out`.

# Testing

Run `./eyeball ./test.sh test.out`