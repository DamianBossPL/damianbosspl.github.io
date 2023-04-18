import random
import re

# Function for creating and prompting a question
def genQuestion():
    ops = ("+", "-", "*")
    # Select operation
    op = random.randint(0, 2)
    # Select 2 random numbers between 1 and 12
    num1 = random.randint(1, 12)
    num2 = random.randint(1, 12)
    # Ask
    answer = ""

    while not re.match("^-?\d+$", answer):
        answer = input(f"{num1} {ops[op]} {num2} = ")
        if not re.match("^-?\d+$", answer):
            print("Invalid number entered.")

    if answer == str(eval(f"{num1}{ops[op]}{num2}")):
        return True
    else:
        return False

def main():
    # Welcome message
    print("Hello there! This is an arithmetic quiz to test your skills.")
    print("There will be 10 questions consisting of addition, subtraction, and multiplication.")
    print("Your score will then be recorded.\n")

    # Ask for name that is 2 letters or longer in length
    name = ""
    while not len(name) >= 2:
        name = input("Enter your name: ").capitalize()
        if not len(name) >= 2:
            print("Name must be 2 letters or longer in length")
    
    # Test
    score = 0
    for i in range(10):
        if genQuestion() == True:
            print("Correct!")
            score = score + 1
        else:
            print("Incorrect.")

    print(f"\n{score}/10 has been answered correctly\n{(score/10)*100}%")
    # Save the score
    scoreFile = open("scores.txt", "a")
    scoreFile.write(f"{name} {score}\n")

main()