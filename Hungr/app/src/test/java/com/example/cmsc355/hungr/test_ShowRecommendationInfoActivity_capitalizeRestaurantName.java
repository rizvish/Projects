package com.example.cmsc355.hungr;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/25/2016.
 */

public class test_ShowRecommendationInfoActivity_capitalizeRestaurantName {

    @Test
    public void capitalizeRestaurantName_Test () throws Exception {
        ShowRecommendationInfoActivity showRecommendationInfoActivity = new ShowRecommendationInfoActivity();
        String restaurantName = "horn dogs";
        assertEquals("Horn Dogs", showRecommendationInfoActivity.capitalizeRestaurantName(restaurantName));
        assertEquals("Horn", showRecommendationInfoActivity.capitalizeRestaurantName("horn"));
        assertEquals("", showRecommendationInfoActivity.capitalizeRestaurantName(""));
    }
}
