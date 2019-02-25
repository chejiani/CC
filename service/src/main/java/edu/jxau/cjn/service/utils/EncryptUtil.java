package edu.jxau.cjn.service.utils;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang3.Validate;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class EncryptUtil {

	private static SecureRandom secureRandom = new SecureRandom();

	public static byte[] Sha1(byte[] salt, byte[] input){
		return Sha1(salt, input, 0);
	}

	public static byte[] Sha1(byte[] salt, byte[] input, int iterations){
		try {
			return digest("SHA-1", salt, input, 0);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return new  byte[0];
		}
	}

	public static byte[] digest(String algorithm, byte[] salt, byte[] input, int iterations) throws NoSuchAlgorithmException {
		MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
		messageDigest.update(salt);
		byte[] digest = messageDigest.digest(input);
		if (iterations > 0){
			for (int i = 0; i < iterations; i++) {
				messageDigest.reset();
				digest = messageDigest.digest(digest);
			}
		}
		return digest;
	}

	public static String generateSalt(int numBytes) {
		Validate.isTrue(numBytes > 0, "numBytes argument must be a positive integer (1 or larger)", numBytes);
		return Hex.encodeHexString(secureRandom.generateSeed(8), false);
	}

}
