int a = 3; // ++연산자에서 ++이 앞에오면 먼저 값을 1만큼 올리고 적용인데 ++이 뒤에오면 값을 먼저 받고 올라감
int b = a--;
int c = a++;
println("a=" +a); //3
println("b=" +b); //3
println("c=" +c); //3
