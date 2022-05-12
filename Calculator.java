import java.util.Scanner;

public class Calculator {
	
	private int num1;
	private int num2;
	private char op;
	
	
	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public char getOp() {
		return op;
	}

	public void setOp(char op) {
		this.op = op;
	}

	void print() {
		try {
			switch(op) {
			case '+' : 
				System.out.printf("%d + %d = %d", num1, num2, num1+num2);
				break;
			case '-' :
				System.out.printf("%d - %d = %d", num1, num2, num1-num2);
				break;
			case '*' : 
				System.out.printf("%d * %d = %d", num1, num2, num1*num2);
				break;
			case '/' : 
				System.out.printf("%d / %d = %d", num1, num2, num1/num2);
				break;
			case '%' :
				System.out.printf("%d %% %d = %d", num1, num2, num1%num2);
				break;
			}
		}
		catch (ArithmeticException e) {
			System.out.println("0으로 나눌 수 없습니다.");
		}
	}

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Calculator cal = new Calculator();
		System.out.print("첫번째 정수를 입력하시오 >> ");
		cal.setNum1(sc.nextInt());
		System.out.print("연산자를 입력하시오((+,-,*,/,%) >> ");
		cal.setOp(sc.next().charAt(0));
		System.out.print("두번째 정수를 입력하시오 >> ");
		cal.setNum2(sc.nextInt());
		cal.print();
		sc.close();

	}

}
