package com.wjl.sshv.sshv;

import java.util.Arrays;

import net.arnx.jsonic.util.Base64;
//import java.util.Base64;



public class MyTest {
	public static void main(String[] args) {
		String s=Base64.encode("dnf".getBytes());
		System.out.println("encode: "+s);
		byte[] bs=Base64.decode(s);
		System.out.println(new String(bs));
		
		
//		byte[] bs=Base64.getEncoder().encode("dnf".getBytes());
//		System.out.println(new String(bs));
//		byte[] res=Base64.getDecoder().decode(bs);
//		System.out.println(new String(res));
	}
}
