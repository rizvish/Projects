package com.example.cmsc355.hungr;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/26/2016.
 */

public class test_MainActivity_getYelpApiParams {
    @Test
    public void getYelpApiParams_Test() throws Exception {
        String consumerKey = "4gMlTiNc9lXpqP9YIwmbJg";
        String consumerSecret = "yKuJ3AV6pkw4ITB4WBfHuZq-JL0";
        String token = "Eeiax8f5iIYnh6IMWmHLVTKYWSGATfr1";
        String tokenSecret = "FtZpcHv3NFy3gKd-XxvvSDmN3Gk";
        String incorrectToken = "Zhou";

        MainActivity mainActivity = new MainActivity();
        assertEquals(consumerKey, mainActivity.getYelpApiParams("CONSUMER_KEY"));
        assertEquals(consumerSecret, mainActivity.getYelpApiParams("CONSUMER_SECRET"));
        assertEquals(token, mainActivity.getYelpApiParams("TOKEN"));
        assertEquals(tokenSecret, mainActivity.getYelpApiParams("TOKEN_SECRET"));
        assertEquals(null, mainActivity.getYelpApiParams(incorrectToken));
    }
}
