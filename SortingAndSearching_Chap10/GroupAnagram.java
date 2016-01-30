package chapter10;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Arrays;

public class GroupAnagram {

	
	public static void main(String[] args) {
		
		ArrayList<String> strArray = new ArrayList<String>();
		
		strArray.add("dog");
		strArray.add("abc");
		
		strArray.add("xyz");
		strArray.add("bcd");
		
		strArray.add("god");
		
		strArray.add("cba");
		strArray.add("zyx");
		
		findAnagram(strArray);
	
	}
	
	public static void findAnagram(ArrayList<String> strArray)  {
		
		HashMap<String,String> hashMap = new HashMap<String,String>();
		
		for (String str : strArray ){
			hashMap.put(sort(str), str);
		}
		
		System.out.println(hashMap);
		
		for(int i = 0; i< strArray.size(); i++) {
			System.out.println(strArray.get(i));
		}
	}
	
	public static String sort(String str) {
		char[] chars = str.toCharArray();
		Arrays.sort(chars);
		String sorted = new String(chars);
		return sorted;
	}
	
	
}
