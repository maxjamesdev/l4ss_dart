# Log4j Log4Shell Scanner Dart (l4ss_dart)
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
`(targets * 3) * payloads`

Please be advised that I do not believe in rate limiting. (But I'll add it ASAP)

-----------------------------------------

Inside of `l4ss.dart` there are two bools, `__log` and `__ver`.

`__log` = true will turn on minimal logging, and enable `__ver` to work.
`__ver` = true will just log everything, because why not. 
