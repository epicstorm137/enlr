# ENLR
Epicstorm's Simple NLR Addon

NOTE: Requires ULX to use the 'ulx removenlr' command!

Features:
- Uses ULX for permissions to the ulx removenlr command
- Custom warning that shows up when you are Breaking NLR
- Ability to edit NLR zone radius, NLR time and a lot more!
- Config in the "sh_nlrloader.lua" file
- Custom notification that comes up above someone's head if they are breaking NLR
- Pre-Caching for the NLR notification, to reduce lag


Instructions:

1) Download File
2) Place in Addons folder of Garry's Mod
3) Load Server and test addon!!!


How it works:

1) When you die, your position gets saved along with the time you died
2) The server will calculate the time the NLR will be over and the client will count down to it
3) Once the time is over, the server time will stop and the client timer should be in sync with it
4) After, the timer will be removed, your NLR will be over and the NLR warning will be removed
