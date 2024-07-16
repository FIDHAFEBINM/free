
abstract class shape{
    int x,y;
    shape(int x,int y){
         this.x=x;
         this.y=y;

    }
    abstract void printarea();
}
class rectangle extends shape{
    rectangle(int x , int y){
        super(x,y);

    }
    void printarea(){
        System.out.println((x*y));
    }

}
class tri extends shape{
    tri(int x,int y){
        super(x,y);
    }
    void printarea(){
        System.out.println((x*y)/2);
    }
}
class interfaces{
    public static void main(String args[]){
        tri obj=new tri(10,2);
        rectangle obj1=new rectangle(10,2);
        obj.printarea();
        obj1.printarea();
    }
}
