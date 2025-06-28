a = input("Type your first letter: ")
b = input("Type your second letter: ")

if a > b:
    print(f"{b} comes before {a}")
elif a < b:
    print(f"{a} comes before {b}")
else:
    print(f"{a} has the some alphabetical position compare to {b}")