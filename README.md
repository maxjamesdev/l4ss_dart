# l4ss_dart
Log4ShellScanner Dart

I love Dart. I hate Log4Shell. Seeing as I am so in touch with my emotions, I comined those two feelings and created this.

It may or may not work, I make no promises about my amazing code. Please don't run it against things you don't have authorization to.

Good luck, and happy holidays.

o7

-----------------------------------------

No arguments, just run `pub get` in the project directory and then `dart l4ss.dart` after you have provided the targest.txt and payloads.txt files.

`targets.txt`- put one url (no http or https in front pls) per line
`payloads.txt`- put one payload variation per line

It will cycle through GET, POST, and PUT methods.

The total amount of requests you make can be found with this: 
`targets * 3) * payloads`
