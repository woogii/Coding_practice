package chapter10;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;



public class GroupAnagram {
	
	public static void main(String[] args) {
		
		String[] strArray = {"dog", "abc", "xyz", "bcd","god", "cba","zyx"};
		
		findAnagram(strArray);
	
	}
	
	public static void findAnagram(String[] strArray)  {
		
		HashMap<String,ArrayList<String>> hashMap = new HashMap<String,ArrayList<String>>();
		ArrayList<String> strList = new ArrayList<String>();
		
		for (String str : strArray ){
			String key = sort(str);
			
			if(!hashMap.containsKey(key)) {
				hashMap.put(key, new ArrayList<String>());
			}
			hashMap.get(key).add(str);
		}
		
		for(Map.Entry<String, ArrayList<String>> entry: hashMap.entrySet()) {
			strList.addAll(entry.getValue());
		}
		
		strArray = strList.toArray(strArray);
		
//		int index = 0;
//		for (String key : hashMap.keySet()) {
//			ArrayList<String> list = hashMap.get(key);
//			for(String s: list){
//				strArray[index] = s;
//				index++;
//			}
//		}
//		
		for(int i = 0; i< strArray.length; i++){
			System.out.println(strArray[i]);
		}
	}
	
	public static String sort(String str) {
		char[] chars = str.toCharArray();
		Arrays.sort(chars);
		String sorted = new String(chars);
		return sorted;
	}
	
	
}
