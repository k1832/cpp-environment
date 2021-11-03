import re, sys, os

if __name__ == "__main__":
    # Search characters needed to be escaped
    escape_pattern = re.compile(r'([\\"])')

    base_path = os.path.abspath(os.path.dirname(__file__))

    file_name = "main.cpp"
    if len(sys.argv) == 2:
        file_name = sys.argv[1]

    full_path = os.path.join(base_path, file_name)

    lines = open(file_name).readlines()
    output = ",\n".join(['"' + escape_pattern.sub(r'\\\1', s[:-1]) + '"' for s in lines])
    print(output)
