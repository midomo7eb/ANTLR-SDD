//Task 8

grammar Task8;

start: operation EOF {System.out.println($operation.val);};
operation returns [double val]
	:l '.' r{$val = $l.val + $r.val;};
l returns [double val,int n]
	:b l1 = l {$n = $l1.n + 1;$val = $b.val * Math.pow(2,$n) + $l1.val;}
	|b{$n = 0;$val = $b.val;};
r returns [double val]
	:b r1 = r {$val = ($r1.val * 0.5) + ($b.val * 0.5);}
	|b{$val = $b.val * 0.5;};
b returns [int val]
	:'0'{$val = 0;}
	|'1'{$val = 1;};
WS : [ \r\n\t] + -> skip;