# -*- coding: utf-8 -*-
import random

def get_input() -> str:
    raise NotImplemented

def get_output() -> str:
    raise NotImplemented

def main():
    # Reserve [1, case_start-1] for AtCoder sample cases
    case_start = 10
    case_count = 30
    for case_i in range(case_start, case_start + case_count + 1):
        input_str = get_input().rstrip()
        output_str = get_output().rstrip()

        with open(f"in_{case_i}.txt", 'w') as f:
            f.write(input_str + "\n")

        with open(f"out_{case_i}.txt", 'w') as f:
            f.write(output_str + "\n")

if __name__ == '__main__':
    main()
