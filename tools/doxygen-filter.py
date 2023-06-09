#!/usr/bin/env python

import sys
import re

if __name__ == '__main__':
    var_regex = re.compile(r'(?:private\s+)?(?P<variable>\w+)\s*=', re.IGNORECASE)
    macro_regex = re.compile(r'\b(?P<macro>[A-Z_][A-Z0-9_]*)\b')

    for line in sys.stdin:
        variables = var_regex.findall(line)
        macros = macro_regex.findall(line)

        # Output the line unchanged
        sys.stdout.write(line)

        # Output the list of variables
        if variables:
            sys.stdout.write('/// @variables ')
            sys.stdout.write(' '.join(variables))
            sys.stdout.write('\n')

        # Output the list of macros
        if macros:
            sys.stdout.write('/// @macros ')
            sys.stdout.write(' '.join(macros))
            sys.stdout.write('\n')
