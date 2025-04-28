#!/bin/bash

# mygrep.sh - A simplified grep implementation
# Usage: ./mygrep.sh [options] <search_pattern> <file>

print_usage() {
    echo "Usage: $0 [options] <search_pattern> <file>"
    echo "Options:"
    echo "  -n    Show line numbers for each match"
    echo "  -v    Invert the match (print lines that do not match)"
    echo "  --help Show this help message"
    exit 1
}

# Initialize variables
show_line_numbers=false
invert_match=false
search_pattern=""
file=""

# Process command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -n)
            show_line_numbers=true
            shift
            ;;
        -v)
            invert_match=true
            shift
            ;;
        -nv|-vn)
            show_line_numbers=true
            invert_match=true
            shift
            ;;
        --help)
            print_usage
            ;;
        -*)
            echo "Error: Unknown option $1"
            print_usage
            ;;
        *)
            if [[ -z "$search_pattern" ]]; then
                search_pattern="$1"
            elif [[ -z "$file" ]]; then
                file="$1"
            else
                echo "Error: Too many arguments"
                print_usage
            fi
            shift
            ;;
    esac
done

# Check if required arguments are provided
if [[ -z "$search_pattern" ]]; then
    echo "Error: Missing search pattern"
    print_usage
fi

if [[ -z "$file" ]]; then
    echo "Error: Missing file name"
    print_usage
fi

# Check if the file exists and is readable
if [[ ! -f "$file" ]]; then
    echo "Error: File '$file' not found"
    exit 2
fi

if [[ ! -r "$file" ]]; then
    echo "Error: Cannot read file '$file'"
    exit 2
fi

# Perform the search
line_number=0
while IFS= read -r line; do
    line_number=$((line_number + 1))
    # Case insensitive match using grep for simplicity
    if echo "$line" | grep -qi "$search_pattern"; then
        matched=true
    else
        matched=false
    fi
    
    # Determine whether to print based on invert_match flag
    if ($matched && ! $invert_match) || (! $matched && $invert_match); then
        if $show_line_numbers; then
            echo "$line_number:$line"
        else
            echo "$line"
        fi
    fi
done < "$file"

exit 0