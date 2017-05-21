package com.example.cmsc355.hungr;

import android.support.test.espresso.Espresso;
import android.support.test.rule.ActivityTestRule;
import org.json.JSONException;
import org.junit.Rule;
import org.junit.Test;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;


/**
 * Created by Kyle on 11/4/2016.
 */

public class GetRecommendationInfoTest{
    String fullResponse = "[{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
            "yelp_api&utm_medium=api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
            "\\/v1\\/stars_4_half.png\",\"review_count\":172,\"name\":\"Hobo Dobo\",\"rating_img_url_small\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/a5221e66bc70\\/ico" +
            "\\/stars\\/v1\\/stars_small_4_half.png\",\"url\":\"https:\\/\\/www.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=yelp_api&utm_medium=" +
            "api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"categories\":[[\"Sandwiches\",\"sandwiches\"],[\"Soup\",\"soup\"],[\"American (New)\",\"newamerican\"]],\"menu_date_updated\":" +
            "1472779506,\"phone\":\"8049723339\",\"snippet_text\":\"Very nice!\",\"image_url\":\"https:\\/\\/s3-media3.fl.yelpcdn.com\\/bphoto\\/50em_CAx0AwSGAP0tttcmQ\\/ms.jpg\",\"snippet_image_url" +
            "\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/photo\\/eaXgtO4A-7KtIWLlEN8rSQ\\/ms.jpg\",\"display_phone\":\"+1-804-555-5555\",\"rating_img_url_large\":\"https:\\/\\/s3-media4.fl.yelpcdn.com" +
            "\\/assets\\/2\\/www\\/img\\/9f83790ff7f6\\/ico\\/stars\\/v1\\/stars_large_4_half.png\",\"menu_provider\":\"single_platform\",\"id\":\"the-naked-onion-richmond\",\"is_closed" +
            "\":false,\"location\":{\"city\":\"Richmond\",\"display_address\":[\"401 Hong Sheng Way\",\"The Zhou\",\"Richmond, VA 23220\"],\"geo_accuracy\":9.5,\"neighborhoods\":[\"The Fan\"]," +
            "\"postal_code\":\"23220\",\"country_code\":\"US\",\"address\":[\"2118 W Cary St\"],\"coordinate\":{\"latitude\":37.5489080495392,\"longitude\":-77.4684175830781},\"state_code\":\"VA\"}}]";

    String missingResponse = "[{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
            "yelp_api&utm_medium=api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
            "\\/v1\\/stars_4_half.png\",\"review_count\":172,\"name\":\"Hobo Dobo\",\"rating_img_url_small\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/a5221e66bc70\\/ico" +
            "\\/stars\\/v1\\/stars_small_4_half.png\",\"url\":\"https:\\/\\/www.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=yelp_api&utm_medium=" +
            "api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"categories\":[[\"Sandwiches\",\"sandwiches\"],[\"Soup\",\"soup\"],[\"American (New)\",\"newamerican\"]],\"menu_date_updated\":" +
            "1472779506,\"phone\":\"8049723339\",\"snippet_text\":\"\",\"image_url\":\"https:\\/\\/s3-media3.fl.yelpcdn.com\\/bphoto\\/50em_CAx0AwSGAP0tttcmQ\\/ms.jpg\",\"snippet_image_url" +
            "\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/photo\\/eaXgtO4A-7KtIWLlEN8rSQ\\/ms.jpg\",\"display_phone\":\"\",\"rating_img_url_large\":\"https:\\/\\/s3-media4.fl.yelpcdn.com" +
            "\\/assets\\/2\\/www\\/img\\/9f83790ff7f6\\/ico\\/stars\\/v1\\/stars_large_4_half.png\",\"menu_provider\":\"single_platform\",\"id\":\"the-naked-onion-richmond\",\"is_closed" +
            "\":false,\"location\":{\"city\":\"Richmond\",\"display_address\":[],\"geo_accuracy\":9.5,\"neighborhoods\":[\"The Fan\"]," +
            "\"postal_code\":\"23220\",\"country_code\":\"US\",\"address\":[\"2118 W Cary St\"],\"coordinate\":{\"latitude\":37.5489080495392,\"longitude\":-77.4684175830781},\"state_code\":\"VA\"}}]";

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);

    /*
            Instrumentation Test for the user story:
            As a basic user that has been recommended a restaurant,
            I want to swipe up to see more information about the restaurant,
            so that I can decide whether or not to eat there.

            SCENARIO:
            Given that the restaurant has data for address, phone number, and a sample review,
            when I swipe down to view more information,
            then all three fields should be displayed to me.
         */
    @Test
    public void FullInformation() throws JSONException{
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(fullResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.sriPhoneNumber)).check(matches(withText("+1-804-555-5555")));
        onView(withId(R.id.sriAddressP1)).check(matches(withText("401 Hong Sheng Way")));
        onView(withId(R.id.sriAddressP2)).check(matches(withText("The Zhou")));
        onView(withId(R.id.sriExampleReview)).check(matches(withText("Very nice!")));
    }


    /*
            Instrumentation Test for the user story:
            As a basic user that has been recommended a restaurant,
            I want to swipe up to see more information about the restaurant,
            so that I can decide whether or not to eat there.

            SCENARIO:
            Given that the restaurant has missing data for address, phone number, or sample review,
            when I swipe down to view more information,
            then a message should tell me the information is missing.
         */
    @Test
    public void MissingInformation() throws JSONException{
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(missingResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.sriPhoneNumber)).check(matches(withText("No Phone Number Given")));
        onView(withId(R.id.sriAddressP1)).check(matches(withText("No Address Given")));
        onView(withId(R.id.sriExampleReview)).check(matches(withText("No Reviews Given")));
    }

    /*
            Instrumentation Test for the user story:
            As a basic user that has been recommended a restaurant,
            I want to swipe up to see more information about the restaurant,
            so that I can decide whether or not to eat there.

            SCENARIO:
            Given that I have swiped down and am viewing the restaurant information,
            when I press the back button,
            then I should be redirected back to the screen that first showed me the restaurant.
         */
    @Test
    public void BackButtonTest() throws JSONException{
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(missingResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        Espresso.pressBack();
        onView(withId(R.id.view_pager)).check(matches(isDisplayed()));
        mActivityRule.getActivity().setTestVar(0);
    }

}
