//package com.example.cmsc355.hungr;
//
//import android.support.test.rule.ActivityTestRule;
//import android.support.test.runner.AndroidJUnit4;
//
//import org.junit.Rule;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//
//import static android.support.test.espresso.Espresso.onView;
//import static android.support.test.espresso.action.ViewActions.click;
//import static android.support.test.espresso.action.ViewActions.typeText;
//import static android.support.test.espresso.assertion.ViewAssertions.matches;
//import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
//import static android.support.test.espresso.matcher.ViewMatchers.withId;
//import static android.support.test.espresso.matcher.ViewMatchers.withText;
//
///**
// * Created by rizvish on 11/29/16.
// */
//@RunWith(AndroidJUnit4.class)
//public class SetRadiusTest {
//
//    @Rule
//    public ActivityTestRule<MainActivity> mActivityRule =
//            new ActivityTestRule<>(MainActivity.class);
//     /*
//        Instrumentation Test for the user story:
//        As a basic user, I want a settings option,
//         so that I can configure the distance of restaurants around me that should be suggested.
//
//        SCENARIO: Given that there are no restaurants in my new radius,
//        when I set the new radius and click the button to get recommendations,
//        there should be an error message telling me what went wrong.
//        */
//    @Test
//    public void noRestaurants(){
//        onView(withId(R.id.search_options)).perform(click());
//        onView(withId(R.id.search_radius)).perform(typeText(String.valueOf("100")));
//        onView(withId(R.id.save_options)).perform(click());
//        onView(withId(R.id.getFoodButton)).perform(click());
//        onView(withText("No restaurants nearby")).check(matches(isDisplayed()));
//        onView(withText("Ok")).perform(click());
//    }
//     /*
//        Instrumentation Test for the user story:
//        As a basic user, I want a settings option,
//         so that I can configure the distance of restaurants around me that should be suggested.
//
//        SCENARIO: Given that there are restaurants in my new radius,
//        when I set that radius and click the button to get recommendations,
//        the restaurant suggestions should be presented to me.
//        */
//
//    @Test
//    public void newRadius(){
//        onView(withId(R.id.search_options)).perform(click());
//        onView(withId(R.id.search_radius)).perform(typeText(String.valueOf("30000")));
//        onView(withId(R.id.save_options)).perform(click());
//        onView(withId(R.id.getFoodButton)).perform(click());
//    }
//    /*
//        Instrumentation Test for the user story:
//        As a basic user, I want a settings option,
//         so that I can configure the distance of restaurants around me that should be suggested.
//
//        SCENARIO: Given that my new radius is invalid (zero or too large),
//        when I set the new radius,
//        then I should receive an error message.
//        */
//    @Test
//    public void invalidRadius(){
//        onView(withId(R.id.search_options)).perform(click());
//        onView(withId(R.id.search_radius)).perform(typeText(String.valueOf("410000")));
//        onView(withId(R.id.save_options)).perform(click());
//        onView(withText("Search Radius must be between 1 and 40000")).check(matches(isDisplayed()));
//        onView(withText("Ok")).perform(click());
//        onView(withId(R.id.cancel_options)).perform(click());
//        onView(withId(R.id.search_options)).perform(click());
//        onView(withId(R.id.search_radius)).perform(typeText(String.valueOf("0")));
//        onView(withId(R.id.save_options)).perform(click());
//        onView(withText("Search Radius must be between 1 and 40000")).check(matches(isDisplayed()));
//        onView(withText("Ok")).perform(click());
//    }
//
//}
