import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert';

class EncryptionHelper{
  // Example key and IV (16 bytes each for AES-128)
  static final key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1'); // 32 chars
  static final iv = encrypt.IV.fromUtf8('8BytesIO12345678'); // 16 chars

  static String encryptData(String plainText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decryptData(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}