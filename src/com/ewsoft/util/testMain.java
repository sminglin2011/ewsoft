package com.ewsoft.util;

import java.util.concurrent.atomic.AtomicInteger;

public class testMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AtomicInteger seq = new AtomicInteger();
		int nextVal = seq.incrementAndGet();
		System.out.println(nextVal+"----------------------------");
	}

}
