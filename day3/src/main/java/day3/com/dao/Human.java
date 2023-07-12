package day3.com.dao;

public class Human {
	// 변수 5개 만들기
	// 접근지시자 private
	// id(hong),name(홍길동),age(20),java(90),oracle(100)
	
	// jsp 파일에서
	// 아이디 : hong
	// 이름 : 홍길동
	// 나이 : 20
	// 자바점수 : 90
	// 오라클점수 : 100
	
	private String id = "hong";
	private String name = "홍길동";
	private int age = 20;
	private int java = 90;
	private int oracle = 100;
	
	public String getId(){
		return id;
	}
	
	public void setId(String id){
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getOracle() {
		return oracle;
	}

	public void setOracle(int oracle) {
		this.oracle = oracle;
	}
	
	public void set() {
		System.out.println(java);
	}
	
}//class
