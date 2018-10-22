"""
Author: David Oniani
Purpose: Homework (problem 8)

NOTE: I have not included the algorithm to check
that 6210001000 is indeed the only number that
meets the conditions. It needs a bit more explanation
for optimizations so I decided to take it out.
"""


def check(ten_digit_number):
    """
    Function to check whether the number satisfied the
    conditions stated in the problem or not.
    """
    for idx in range(len(list(str(ten_digit_number)))):
        digit = list(str(ten_digit_number))[idx]
        if int(digit) != str(ten_digit_number).count(str(idx)):
            return False
    return True


def main():
    """
    Verify that 6210001000 meets the conditions.
    """
    print(check(6210001000))  # True! Thus, this number is indeed the answer


if __name__ == "__main__":
    main()
