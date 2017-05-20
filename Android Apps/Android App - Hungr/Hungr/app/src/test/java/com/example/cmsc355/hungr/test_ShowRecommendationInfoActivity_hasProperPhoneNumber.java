package com.example.cmsc355.hungr;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/26/2016.
 */

public class test_ShowRecommendationInfoActivity_hasProperPhoneNumber {
    @Test
    public void hasProperPhoneNumber_Test() {
        ShowRecommendationInfoActivity showRecommendationInfoActivity =
                new ShowRecommendationInfoActivity();
        String correctFormat = "+1-804-555-5555";
        String incorrectFormat = "+1-804-557";
        String badResponse = "No Phone Number Given";
        assertEquals(true, showRecommendationInfoActivity
        .hasProperPhoneNumber(correctFormat));
        assertEquals(false, showRecommendationInfoActivity
        .hasProperPhoneNumber(incorrectFormat));
        assertEquals(false, showRecommendationInfoActivity
        .hasProperPhoneNumber(badResponse));
    }
}
