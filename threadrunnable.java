import java.util.Scanner;
class fibonacci implements Runnable{
    int n;
    fibonacci(int n){
        this.n=n;

    }
    public void run(){
    int a=0;
    int b=1,sum=0;
    
    for (int i=0;i<n;i++){
        System.out.println(a);
        sum=a+b;
        a=b;
        b=sum;
        
    }
    }
}
class even implements Runnable{
    int n;
    even(int n){
        this.n=n;    }
    public void run(){
       
        
        for (int i=0;i<n;i++){
            if(i%2==0){
                System.out.println("e:"+i);
            }
        }
    }
}
class treats{
    public static void main(String args[]){
        Scanner sc=new Scanner(System.in);
    System.out.println("enter fib");
    int n=sc.nextInt();
    System.out.println("enter even");
    int m=sc.nextInt();
        fibonacci t=new fibonacci(n);
        even e=new even(m);
        Thread ts=new Thread(t);
        Thread tr=new Thread(e);
       ts.start();
       tr.start();
    }
}
