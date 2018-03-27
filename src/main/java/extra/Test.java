package extra;

public class Test {
	public static void main(String args[]) {
		Mem m = new Mem();
		m.setName("revanth");
		m.setPhone("758458653");
		String jsonmem = JsonUtil.convertJavaToJson(m);
		System.out.println(jsonmem);
		
	}

}
