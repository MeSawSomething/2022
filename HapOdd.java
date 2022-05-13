import java.util.Scanner;


public class HapOdd {

	public static void main(String[] args) {
		int hap = 0;
		int i;

		Scanner sc = new Scanner(System.in);
		System.out.println("Insert min odd value 합을 구하는 최저 홀수 입력 >>>>");
			int min = sc.nextInt();
		System.out.println("Insert max odd value 합을 구하고자하는 최대 홀수 입력 >>>>");
			int max = sc.nextInt();
		
		for(i=min ; i<=max ;i+=2){
			hap = hap+i;
			System.out.printf("%d", hap);
			}

	}

}
