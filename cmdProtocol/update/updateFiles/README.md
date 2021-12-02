# **CMD Protocol**

The cmd protocol is a way to run Command Prompt commands from your browser. It can be useful in some situations and can possibly save your computer from disaster

## **Installation**

To install said protocol, click [here](https://github.com/DamianBossPL/cmd-protocol/archive/refs/heads/master.zip). Once downloaded, unzip the file into a folder. Then, run `Install`

## **Usage**

To use it, go into your browser. In the address bar, type in `cmd://` and type in a cmd command. For instance:

```
cmd://echo This is the cmd protocol!
```
It'll ask to open the "`Windows Command Processor`". Press it. It will then display something like this:
```
Argument passed into the app:
cmd://echo%20This%20is%20the%20cmd%20protocol!/

Converted argument:
echo This is the cmd protocol!

Are you sure you want to run this command? [y/n]
```
The app is run on Python and installed in `C:\Windows\cmdProtocol\python-runtime`. When the URL is passed through, it displays some characters in hex codes and can't be read by the computer normally. So I made a parser that replaces the hex codes with readable characters (the parser can be found in the 'src' folder). Then you can run the command normally with `y`. Anything other than 'y' will cancel the command, otherwise, the command will run normally

## **Uninstalling**

To uninstall the protocol, run `Uninstall` and it will remove all the contents that was installed previously

## **Other Information**

The `Enable` and `Disable` will turn on or off the protocol without modifying the installation files. Remember, if you want to uninstall, use `Uninstall` and not `Disable`.

## **Credit**

Made by: DamianBossPL

Inspiration: [Enderman](https://youtu.be/46pBeyHKQuQ) (he originally made the cmd protocol with `C` and I made it in `Python`)