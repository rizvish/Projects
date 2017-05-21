package com.example.cmsc355.hungr;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/25/2016.
 */

public class test_MainActivity_setBusinessCount {
    @Test
    public void setBusinessCount_Test() throws Exception {
        MainActivity mainActivity = new MainActivity();
        mainActivity.setTestVar(1);
        JSONArray testArray = new JSONArray();
        JSONObject business1 = new JSONObject();
        testArray.put(business1);
        mainActivity.setMockMasterArray(testArray.toString());
        mainActivity.setBusinessCount();
        assertEquals(1, mainActivity.getBusinessCount());

        testArray = new JSONArray();
        mainActivity.setMockMasterArray(testArray.toString());
        mainActivity.setBusinessCount();
        assertEquals(0, mainActivity.getBusinessCount());

        testArray = new JSONArray();
        JSONObject business2 = new JSONObject();
        testArray.put(business1);
        testArray.put(business2);
        mainActivity.setMockMasterArray(testArray.toString());
        mainActivity.setBusinessCount();
        assertEquals(2, mainActivity.getBusinessCount());
    }
}
