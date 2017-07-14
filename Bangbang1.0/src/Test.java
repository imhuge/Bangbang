
public class Test {

	public static void main(String[] args) {
		String content = "回复tigger:";
		System.out.println(content.subSequence(0, 2));
		System.out.println(content.charAt(content.length() - 1));
		content = content.substring(2);
		System.out.println(content);
	}

}
