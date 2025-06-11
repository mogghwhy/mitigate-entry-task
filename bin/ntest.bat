echo off
set arg1=%1
shift

ruby -Ilib:test test/vending_machine_test.rb -n %arg1%