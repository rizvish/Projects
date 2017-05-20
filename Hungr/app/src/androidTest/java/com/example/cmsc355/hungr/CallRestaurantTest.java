package com.example.cmsc355.hungr;

import android.app.Instrumentation;
import android.content.Intent;
import android.support.test.espresso.intent.Intents;
import android.support.test.rule.ActivityTestRule;

import org.hamcrest.Matcher;
import org.json.JSONException;
import org.junit.Rule;
import org.junit.Test;


import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.intent.Intents.intended;
import static android.support.test.espresso.intent.Intents.intending;
import static android.support.test.espresso.intent.matcher.IntentMatchers.hasAction;
import static android.support.test.espresso.intent.matcher.IntentMatchers.hasData;
import static android.support.test.espresso.matcher.RootMatchers.withDecorView;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.not;
import static org.hamcrest.core.AllOf.allOf;


/**
 * Created by Kyle on 11/4/2016.
 */

public class CallRestaurantTest {
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

    String partialPhoneResponse = "[{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
            "yelp_api&utm_medium=api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
            "\\/v1\\/stars_4_half.png\",\"review_count\":172,\"name\":\"Hobo Dobo\",\"rating_img_url_small\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/a5221e66bc70\\/ico" +
            "\\/stars\\/v1\\/stars_small_4_half.png\",\"url\":\"https:\\/\\/www.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=yelp_api&utm_medium=" +
            "api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"categories\":[[\"Sandwiches\",\"sandwiches\"],[\"Soup\",\"soup\"],[\"American (New)\",\"newamerican\"]],\"menu_date_updated\":" +
            "1472779506,\"phone\":\"8049723339\",\"snippet_text\":\"\",\"image_url\":\"https:\\/\\/s3-media3.fl.yelpcdn.com\\/bphoto\\/50em_CAx0AwSGAP0tttcmQ\\/ms.jpg\",\"snippet_image_url" +
            "\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/photo\\/eaXgtO4A-7KtIWLlEN8rSQ\\/ms.jpg\",\"display_phone\":\"555\",\"rating_img_url_large\":\"https:\\/\\/s3-media4.fl.yelpcdn.com" +
            "\\/assets\\/2\\/www\\/img\\/9f83790ff7f6\\/ico\\/stars\\/v1\\/stars_large_4_half.png\",\"menu_provider\":\"single_platform\",\"id\":\"the-naked-onion-richmond\",\"is_closed" +
            "\":false,\"location\":{\"city\":\"Richmond\",\"display_address\":[],\"geo_accuracy\":9.5,\"neighborhoods\":[\"The Fan\"]," +
            "\"postal_code\":\"23220\",\"country_code\":\"US\",\"address\":[\"2118 W Cary St\"],\"coordinate\":{\"latitude\":37.5489080495392,\"longitude\":-77.4684175830781},\"state_code\":\"VA\"}}]";

    String noPhoneResponse = "[{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
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

    @Rule
    public ActivityTestRule<ShowRecommendationInfoActivity> showRecommendationInfoActivityActivityTestRule =
            new ActivityTestRule<>(ShowRecommendationInfoActivity.class);


    /*
            Instrumentation Test for the user story:
            As a basic user who has been suggested a restaurant and is viewing the restaurant's information,
            I want to be able to click on the restaurant's phone number,
            so that the number will be automatically loaded into my phone app and ready to dial.

            SCENARIO:
            Given that the restaurant has a complete phone number displayed,
            when I click on the phone number,
            the phone number should be loaded into my phone app and ready to call.

         */

    @Test
    public void FullInformation() throws JSONException{
        mActivityRule.getActivity().setTestVar(1);

        Intents.init();
        Matcher intent = allOf(hasAction(Intent.ACTION_DIAL), hasData("tel:18045555555"));
        intending(intent).respondWith(new Instrumentation.ActivityResult(0, null));

        mActivityRule.getActivity().setMockMasterArray(fullResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.sriPhoneNumber)).check(matches(withText("+1-804-555-5555")));
        onView(withId(R.id.sriPhoneNumber)).perform(click());

        intended(intent);
        Intents.release();

        mActivityRule.getActivity().setTestVar(0);
    }

    /*
            Instrumentation Test for the user story:
            As a basic user who has been suggested a restaurant and is viewing the restaurant's information,
            I want to be able to click on the restaurant's phone number,
            so that the number will be automatically loaded into my phone app and ready to dial.

            SCENARIO:
            Given that the restaurant has an incomplete phone number displayed,
            when I click on the phone number,
            an error message should appear telling me what went wrong.

         */

    @Test
    public void MissingInformation() throws JSONException{
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(partialPhoneResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.sriPhoneNumber)).perform(click());
        onView(withId(R.id.sriPhoneNumber))
                .inRoot(withDecorView(not(showRecommendationInfoActivityActivityTestRule
                        .getActivity().getWindow().getDecorView())))
                .check(matches((isDisplayed())));
        mActivityRule.getActivity().setTestVar(0);
    }

    /*
            Instrumentation Test for the user story:
            As a basic user who has been suggested a restaurant and is viewing the restaurant's information,
            I want to be able to click on the restaurant's phone number,
            so that the number will be automatically loaded into my phone app and ready to dial.

            SCENARIO:
            Given that the restaurant has no phone number displayed,
            when I click on the phone number,
            an error message should appear telling me what went wrong.

         */

    @Test
    public void NoInformation() throws JSONException{
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(noPhoneResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.sriPhoneNumber)).check(matches(withText("No Phone Number Given")));
        onView(withId(R.id.sriPhoneNumber)).perform(click());
        onView(withText("No Phone Number Given"))
                .inRoot(withDecorView(not(showRecommendationInfoActivityActivityTestRule
                        .getActivity().getWindow().getDecorView())))
                        .check(matches((isDisplayed())));
        mActivityRule.getActivity().setTestVar(0);
    }

}
