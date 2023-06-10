import sys
import os
import subprocess

def main():
    working_directory = sys.argv[1]
    script_directory = os.path.dirname(os.path.abspath(__file__))

    # Set the working directory in the Dockerfile
    os.chdir(os.path.join(script_directory, working_directory))

    # Change the permissions of sqf_filter.py
    file_path = os.path.join(working_directory, 'sqf_filter.py')
    subprocess.run(['chmod', '+x', file_path])

if __name__ == "__main__":
    main()
