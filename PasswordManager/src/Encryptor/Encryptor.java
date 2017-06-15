package Encryptor;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

import java.lang.reflect.Field;

/**
 * Created by Kyle on 4/15/2017.
 */

public class Encryptor {
    private static Encryptor encryptor;

    private StandardPBEStringEncryptor stringEncryptor;

    private Encryptor() {}

    public static Encryptor getInstance() {
        if (encryptor == null) {
            encryptor = new Encryptor();
            encryptor.stringEncryptor = new StandardPBEStringEncryptor();
            encryptor.stringEncryptor.setProvider(new BouncyCastleProvider());
            encryptor.stringEncryptor.setAlgorithm("PBEWITHSHA256AND128BITAES-CBC-BC");
            encryptor.stringEncryptor.setPassword("AphzZs0R3qyRU49u");

        }
        return encryptor;
    }

    public StandardPBEStringEncryptor getEncryptionTool() {
        return stringEncryptor;
    }

}
