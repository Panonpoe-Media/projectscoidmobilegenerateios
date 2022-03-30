import 'dart:typed_data';
import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:crypto/crypto.dart';
import "package:pointycastle/export.dart";
import "package:pointycastle/api.dart" as p;
import "package:pointycastle/src/impl/secure_random_base.dart";
import "package:pointycastle/src/registry/registry.dart";
import "package:asn1lib/asn1lib.dart";
//import "package:steel_crypt/steel_crypt.dart";

class SecureString {

  static Key getKey() {
    return Key(Uint8List.fromList([
      0x36, 0xab, 0x0f, 0x87, 0xa3, 0x89, 0x8e, 0x59, 
      0x7e, 0x19, 0xb9, 0x8b, 0x4c, 0x98, 0x00, 0x9b,
      0x25, 0x95, 0x86, 0xd9, 0xa2, 0x7e, 0xe2, 0xc8,
      0x93, 0x6e, 0xa0, 0x50, 0x29, 0xf5, 0xa3, 0x95
    ]));
  }

  static IV getIV() {
    return IV(Uint8List.fromList([
      0xd3, 0xf5, 0xb7, 0x37, 0x3b, 0xbc, 0x0c, 0x14
    ]));
  }

  static String encrypt(String str)
  {
    final encrypter = Encrypter(Salsa20(getKey()));
    final encrypted = encrypter.encrypt(str, iv: getIV());
    return encrypted.base64;
  }

  static String decrypt(String str)
  {
    try {
      final encrypter = Encrypter(Salsa20(getKey()));
      return encrypter.decrypt(Encrypted.fromBase64(str), iv: getIV());
    } on Exception catch (_) {
      return "";
    }
  }

}
String  generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
String authSecure(String token){
  DateTime now = DateTime.now();
  String dt = DateFormat('yyyymmddhhmmss').format(now);
  String rd = randomAlphaNumeric(10);
 // print('tokeeennnn ==== $token');
  //(random/user/yyyymmddhhnnss/9731-projectscoid)
  String signature = generateMd5('$rd/$token/$dt/9731-projectscoid');
  String auth  =  '$rd/$token/$dt/$signature';
  return auth;
}

Uint8List _processInBlocks(AsymmetricBlockCipher engine, Uint8List input) {
  final numBlocks = input.length ~/ engine.inputBlockSize +
      ((input.length % engine.inputBlockSize != 0) ? 1 : 0);

  final output = Uint8List(numBlocks * engine.outputBlockSize);

  var inputOffset = 0;
  var outputOffset = 0;
  while (inputOffset < input.length) {
    final chunkSize = (inputOffset + engine.inputBlockSize <= input.length)
        ? engine.inputBlockSize
        : input.length - inputOffset;

    outputOffset += engine.processBlock(
        input, inputOffset, chunkSize, output, outputOffset);

    inputOffset += chunkSize;
  }

  return (output.length == outputOffset)
      ? output
      : output.sublist(0, outputOffset);
}

List<int> decodePEM(String pem) {
  var startsWith = [
    "-----BEGIN PUBLIC KEY-----",
    "-----BEGIN PRIVATE KEY-----",
    "-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
    "-----BEGIN PGP PRIVATE KEY BLOCK-----\r\nVersion: React-Native-OpenPGP.js 0.1\r\nComment: http://openpgpjs.org\r\n\r\n",
  ];
  var endsWith = [
    "-----END PUBLIC KEY-----",
    "-----END PRIVATE KEY-----",
    "-----END PGP PUBLIC KEY BLOCK-----",
    "-----END PGP PRIVATE KEY BLOCK-----",
  ];
  bool isOpenPgp = pem.indexOf('BEGIN PGP') != -1;

  for (var s in startsWith) {
    if (pem.startsWith(s)) {
      pem = pem.substring(s.length);
    }
  }

  for (var s in endsWith) {
    if (pem.endsWith(s)) {
      pem = pem.substring(0, pem.length - s.length);
    }
  }

  if (isOpenPgp) {
    var index = pem.indexOf('\r\n');
    pem = pem.substring(0, index);
  }

  pem = pem.replaceAll('\n', '');
  pem = pem.replaceAll('\r', '');

  return base64.decode(pem);
}
/*
parsePublicKeyFromPem(String pemString) {
  List<int> publicKeyDER = decodePEM(pemString);
  var asn1Parser = new ASN1Parser(publicKeyDER);
  var topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;
  var publicKeyBitString = topLevelSeq.elements[1];

  var publicKeyAsn = new ASN1Parser(publicKeyBitString.contentBytes());
  ASN1Sequence publicKeySeq = publicKeyAsn.nextObject();
  var modulus = publicKeySeq.elements[0] as ASN1Integer;
  var exponent = publicKeySeq.elements[1] as ASN1Integer;

  RSAPublicKey rsaPublicKey = RSAPublicKey(
      modulus.valueAsBigInteger,
      exponent.valueAsBigInteger
  );

  return rsaPublicKey;
}

 */

class FixedSecureRandom extends SecureRandomBase {
  static final FactoryConfig FACTORY_CONFIG =
  new StaticFactoryConfig(p.SecureRandom, "Fixed", () => FixedSecureRandom());

  var _next = 0;
  var _values;

  String get algorithmName => "Fixed";

  /// Set the fixed values to use and reset to the beginning of it.
  void seed(covariant KeyParameter params) {
    _values = params.key; // set the values to use (could be null or empty)
    _next = 0; // reset to the beginning of the values
  }

  int nextUint8() {
    if (_values != null && _values.isNotEmpty) {
      if (_next >= _values.length) {
        _next = 0; // reset to beginning of the array
      }
      return _values[_next++];
    } else {
      return 0; // value when not set with any values
    }
  }
}

/*
Uint8List rsaEncrypt(String myPublic, List<int> dataToEncrypt) {
  var EncryptData = Uint8List.fromList(dataToEncrypt);
  var  bs64 =    base64.decode(myPublic);
  var keyParams = new  KeyParameter(new Uint8List.fromList(bs64));
  var secureRandom = new FixedSecureRandom ();
 // var encrypter2 = RsaCrypt();
  secureRandom.seed(new KeyParameter(new Uint8List.fromList(bs64)));

  var rngParams = new ParametersWithRandom(keyParams,secureRandom);
 // final keyGen = new RSAKeyGenerator();
 // keyGen.init(rngParams);
 // var kg = keyGen.generateKeyPair();
  var pk =  parsePublicKeyFromPem(myPublic);
  print('public key ==' + pk.n.toString());
 // var crypted2 = encrypter2.encrypt('test1234', pk);
 // print('rsa oaep padding == $crypted2');
  final encryptor = AsymmetricBlockCipher('RSA/OAEP')
    ..init(true, PublicKeyParameter<RSAPublicKey>(pk)); // true=encrypt

  return _processInBlocks(encryptor, EncryptData);
}

 */