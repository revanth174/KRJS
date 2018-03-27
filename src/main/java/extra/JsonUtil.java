package extra;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;

public class JsonUtil {
	
	private static ObjectMapper mapper;
	static {
		mapper = new ObjectMapper();
	}
	
	public static String convertJavaToJson (Mem m) {
		try {
			String s = mapper.writeValueAsString(m);
			return s;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
