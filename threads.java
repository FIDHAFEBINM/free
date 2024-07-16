import java.util.*;
class a extends Thread{
    public void run(){
        int i=0;
        while(i<5){
        System.out.println("good morning");
        try{
            sleep(1000);
        }
        catch(Exception e){}
        i++;
    }

}}
class b extends Thread{
    public void run(){
        int i=0;
        while(i<5){
        System.out.println("hello");
        try{
            sleep(3000);
        }
        catch(InterruptedException e){
            System.out.println("exception interepted");
        }i++;
    }}

}



class threads{
    public static void main(String args[]){
        a threada=new a();
        b threadb=new b();
        
        threada.start();
        threadb.start();
       
    }
}
