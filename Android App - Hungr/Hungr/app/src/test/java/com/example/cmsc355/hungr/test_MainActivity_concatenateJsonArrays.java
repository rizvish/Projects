package com.example.cmsc355.hungr;

import org.json.JSONArray;
import org.junit.Test;

import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

/**
 * Created by Kyle on 11/25/2016.
 */

public class test_MainActivity_concatenateJsonArrays {
    @Test
    public void concatenateJsonArrays_Test() throws Exception {
        JSONArray firstHalf = new JSONArray();
        firstHalf.put("name");

        JSONArray secondHalf = new JSONArray();
        secondHalf.put("address");

        JSONArray combinedHalves = new JSONArray();
        combinedHalves.put("name");
        combinedHalves.put("address");

        JSONArray incorrectHalf = new JSONArray();
        incorrectHalf.put("HongSheng");

        MainActivity mainActivity = new MainActivity();
        JSONArray assertTest = mainActivity.concatenateJsonArrays(firstHalf, secondHalf);
        assertEquals(assertTest.toString(), combinedHalves.toString());
        assertNotEquals(assertTest.toString(), incorrectHalf.toString());
    }
}
