# sqf_filter.py
import sys
import re

def process_sqf(sqf_code):
    # Define regular expressions for parsing SQF comments, parameters, and variables
    comment_pattern = re.compile(r'/\*([^*]|[\*]+(?!\*)|(?<!\*)[\*])*\*/')
    param_pattern = re.compile(r'@param\s+([\w]+)\s+\(([\w\s]+)\)\s*(?:;[\s\S]*?)?')
    var_pattern = re.compile(r'^_\s*(\w+)\s+([\w\s]+)')

    # Find all comments, parameters, and variables in the SQF code
    comments = comment_pattern.findall(sqf_code)
    params = param_pattern.findall(sqf_code)
    vars = var_pattern.findall(sqf_code)

    # Combine the comments, parameters, and variables into a single string
    content = "\n".join(comments)
    for param in params:
        param_name, param_type = param
        content += f"\n@param {param_name} {param_type}\n"
    for var in vars:
        var_name, var_type = var
        content += f"\n{var_name} {var_type}\n"

    # Return the parsed content
    return content

if __name__ == "__main__":
    sqf_code = sys.stdin.read()
    parsed_content = process_sqf(sqf_code)
    sys.stdout.write(parsed_content)
