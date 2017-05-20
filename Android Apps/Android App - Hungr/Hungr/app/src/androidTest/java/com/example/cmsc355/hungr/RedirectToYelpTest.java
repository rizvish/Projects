package com.example.cmsc355.hungr;

import android.app.Instrumentation;
import android.content.Intent;
import android.support.test.espresso.Espresso;
import android.support.test.espresso.intent.Intents;
import android.support.test.espresso.intent.rule.IntentsTestRule;
import android.support.test.rule.ActivityTestRule;

import org.hamcrest.Matcher;
import org.hamcrest.Matchers;
import org.json.JSONException;
import org.junit.Rule;
import org.junit.Test;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.intent.Intents.intended;
import static android.support.test.espresso.intent.Intents.intending;
import static android.support.test.espresso.intent.Intents.times;
import static android.support.test.espresso.intent.matcher.IntentMatchers.hasAction;
import static android.support.test.espresso.intent.matcher.IntentMatchers.hasData;
import static android.support.test.espresso.intent.matcher.UriMatchers.hasHost;
import static android.support.test.espresso.matcher.RootMatchers.withDecorView;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.core.AllOf.allOf;

/**
 * Created by connerza on 11/27/16.
 */

public class RedirectToYelpTest {
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

    String missingResponse = "[{\"is_claimed\":true,\"rating\":4.5,\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
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
            new ActivityTestRule<MainActivity>(MainActivity.class);

    /*
        As a basic user that has been recommended a restaurant,
        I want to click a button that takes me to Yelp for that restaurant,
        so that I can decide whether or not to eat there.
     */

    /*
        Given that the restaurant is on Yelp,
        when the user clicks the button to view the restaurant in Yelp and then clicks the back button,
        then the restaurant information screen should be displayed again.
     */
    @Test
    public void OnYelpPressBackButtonTest () {

        Intents.init();

        Matcher intent = allOf(hasAction(Intent.ACTION_VIEW));
        intending(intent).respondWith(new Instrumentation.ActivityResult(0, null));

        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(fullResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.yelpButton)).perform(click());

        intending(intent);
        Intents.release();
        onView(withId(R.id.yelpButton)).check(matches(isDisplayed()));
    }

    /*
        Given that the restaurant does not have a valid mobile URL,
        when they click the button,
        then a toast should appear telling them what happened.

    */

    @Test
    public void NoURLTest () {
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(missingResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.yelpButton)).perform(click());

        //Make sure we get a Toast
        onView(withText("No valid restaurant URL!"))
                .inRoot(withDecorView(Matchers.not(mActivityRule.getActivity().getWindow().getDecorView())))
                .check(matches((isDisplayed())));
    }

    /*
        Given that the restaurant is on Yelp,
        when the user clicks the button to view the restaurant in Yelp,
        then Yelp should be opened on that restaurant's profile.

     */
    @Test
    public void RedirectToYelpTest () {

        Intents.init();

        Matcher intent = allOf(hasAction(Intent.ACTION_VIEW));
        intending(intent).respondWith(new Instrumentation.ActivityResult(0, null));

        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(fullResponse);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.mockitoNavigationButton)).perform(click());
        onView(withId(R.id.yelpButton)).perform(click());
        intended(intent);
        Intents.release();
    }

}

