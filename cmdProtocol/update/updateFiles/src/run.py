### Made by DamianBossPL

# Import

import sys
import os

# Args reader

try:
    arg=sys.argv[1]
except:
    arg="cmd://cmd.exe"

print("Argument passed into the app:\n" + arg)

# URL Formatting

arg=arg.replace('cmd://', '')
arg=arg.strip('/')


# URL Parsing

arg = arg.replace('%20', ' ')
arg = arg.replace('%22', '"')
arg = arg.replace('%25', '%')
arg = arg.replace('%3C', '<')
arg = arg.replace('%3E', '>')
arg = arg.replace('%5C', '\\')
arg = arg.replace('%60', '`')
arg = arg.replace('%7B', '{')
arg = arg.replace('%7C', '|')
arg = arg.replace('%7D', '}')
arg = arg.replace('%E2%82%AC', '€')

print("\nConverted argument:\n" + arg)

user=input("\nAre you sure you want to run this command? [y/n] ")
if user=="y":
    os.system('cmd /c ' + arg)
    input("\nCommand has successfully been executed")
else:
    input("Command has been canceled . . .")
