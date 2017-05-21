package com.example.cmsc355.hungr;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/25/2016.
 */

public class test_ShowRecommendationInfoActivity_makeIntentPhoneNumber {

    @Test
    public void makeIntentPhoneNumber_Test () throws Exception {
        ShowRecommendationInfoActivity showRecommendationInfoActivity = new ShowRecommendationInfoActivity();
        assertEquals("tel:8045555555", showRecommendationInfoActivity.makeIntentPhoneNumber("+804-555-5555"));
        assertEquals("tel:", showRecommendationInfoActivity.makeIntentPhoneNumber(""));
    }
}
