# mygrep - A Custom grep Implementation

A simplified implementation of the Unix `grep` command built in Bash.

## Features

- Search for strings in text files (case-insensitive)
- Display line numbers with matches
- Invert matches to show non-matching lines
- Combines options for flexibility
- Proper error handling for invalid inputs

## Installation

1. Clone this repository:
   ```
   git clone MuhamedIbraHim7/Custom-grep-Command-Project
   cd mygrep-project
   ```

2. Make the script executable:
   ```
   chmod +x mygrep.sh
   ```

## Usage

Basic usage:
```
./mygrep.sh <search_pattern> <file>
```

Options:
- `-n`: Show line numbers for each match
- `-v`: Invert the match (print lines that do not match)
- `--help`: Display help message

Examples:
```
# Basic search for "hello" in testfile.txt
./mygrep.sh hello testfile.txt

# Search with line numbers
./mygrep.sh -n hello testfile.txt

# Invert match with line numbers
./mygrep.sh -vn hello testfile.txt
```

## Sample Output

Searching for "hello" in the test file:
```
Hello world
HELLO AGAIN
```

With line numbers:
```
1:Hello world
4:HELLO AGAIN
```

With inverted match and line numbers:
```
2:This is a test
3:another test line
5:Don't match this line
6:Testing one two three
```

## Technical Implementation

### Argument Processing
The script processes command line arguments in a loop, handling options like `-n`, `-v`, and combinations like `-nv`. It uses flags to track whether to show line numbers or invert matches.

### Search Implementation
The script reads the input file line by line, using case-insensitive matching to find the search pattern. Based on the provided options, it then determines whether to display each line and in what format.

### Error Handling
The script includes comprehensive error handling for:
- Missing arguments (search pattern or file)
- Non-existent files
- Unreadable files
- Unknown options

## Extending the Implementation

### Supporting Additional grep Features

To support features like regex patterns or additional options like `-i` (case-insensitive), `-c` (count matches), or `-l` (list filenames only):

1. **Regex Support**: The current script uses grep's `-q` option for simple pattern matching. To support full regex, we could use Bash's built-in regex capabilities with `=~` operator.

2. **Additional Options**: We would extend the option parsing section to recognize new flags and set corresponding variables. For each new option, we'd add the necessary logic in the processing loop.

3. **Structured Approach**: For a more maintainable implementation, we could refactor the script into functions, with separate functions for:
   - Option parsing
   - File validation
   - Pattern matching
   - Output formatting

4. **Multiple File Support**: To handle multiple files like the real grep, we would modify the argument parsing to collect all non-option arguments after the pattern as file names, then process each file in turn.

## Development Challenges

The most challenging part of implementing this script was handling the combined options (like `-vn`) correctly. This required careful consideration of how to parse these options while maintaining the correct behavior. 

The other challenge was ensuring case-insensitive matching worked properly across different text variations while maintaining grep-like output formatting.

---