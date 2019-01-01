#!/usr/bin/perl -w

$scalar = 'bebebeb';
($a, $b) = (1, 2);
@arr = ('aaa', 123, $scalar, $a+$b);
print $arr[1]."\n";
push @arr, 33;
print $arr[-1]."\n"; # 33
pop @arr;
print $arr[-1]."\n"; # 3
