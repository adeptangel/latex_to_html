#!/bin/bash

# $1: input directory path
traverse_dir() {
    # For each file in dir given as first argument
    for file in "$1"/*
    do
        # If a file is a directory, recurse into it
        if [ -d "$file" ]
        then
            traverse_dir "$file"
        # If file is not a directory, check if it ends in .tex
        elif [ -f "$file" ]
        then
            # Assume the file is LaTeX if it ends in .tex
            if basename "$file" | grep -q "\.tex$"
            then
                name="$(basename -s .md "$file")"
                # TODO: tex command(s) here
            fi
        fi
    done
}

traverse_dir "$1"
printf "Done.\n"
