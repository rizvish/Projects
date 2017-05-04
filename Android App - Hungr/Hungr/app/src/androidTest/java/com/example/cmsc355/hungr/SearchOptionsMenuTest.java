package com.example.cmsc355.hungr;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.replaceText;
import static android.support.test.espresso.action.ViewActions.typeText;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withHint;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
@RunWith(AndroidJUnit4.class)

public class SearchOptionsMenuTest {

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);

    @Test
    public void savedSettingsTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want access to a search options menu,
            so that I can modify the options used when searching for a restaurant.

            SCENARIO:
            Given that I have chosen my options in the search options menu,
            when I click the save button,
            then my settings will be saved when I return to the options menu again.
         */
        onView(withId(R.id.search_options)).perform(click());
        onView(withId(R.id.search_radius)).perform(typeText(String.valueOf("8000")));
        onView(withId(R.id.max_search_results)).perform(typeText(String.valueOf("15")));
        onView(withId(R.id.save_options)).perform(click());

        // Now return again to the search options menu to verify.
        onView(withId(R.id.search_options)).perform(click());
        onView(withId(R.id.search_radius)).check(matches(withHint("8000")));
        onView(withId(R.id.max_search_results)).check(matches(withHint("15")));
    }

    @Test
    public void discardSettingsTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want access to a search options menu,
            so that I can modify the options used when searching for a restaurant.

            SCENARIO:
            Given that I am on the search options menu and wish to discard my choices,
            when I click the cancel button,
            then I will return to the main screen with my changes discarded.
         */
        onView(withId(R.id.search_options)).perform(click());
        onView(withId(R.id.search_radius)).perform(typeText(String.valueOf("8000")));
        onView(withId(R.id.max_search_results)).perform(typeText(String.valueOf("15")));
        onView(withId(R.id.cancel_options)).perform(click());

        // Now return again to verify that the changes were DISCARDED.
        onView(withId(R.id.search_options)).perform(click());
        onView(withId(R.id.search_radius)).check(matches(withHint("40000")));
        onView(withId(R.id.max_search_results)).check(matches(withHint("20")));
    }

    @Test
    public void incorrectOptionTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want access to a search options menu,
            so that I can modify the options used when searching for a restaurant.

            SCENARIO:
            Given that I have entered an incorrect value for a search option,
            when I click the save button,
            then I will receive an error message explaining the error for the search option.
         */
        onView(withId(R.id.search_options)).perform(click());
        onView(withId(R.id.search_radius)).perform(typeText(String.valueOf("410000")));
        onView(withId(R.id.save_options)).perform(click());
        onView(withText("Search Radius must be between 1 and 40000")).check(matches(isDisplayed()));
        onView(withText("Ok")).perform(click());
        onView(withId(R.id.search_radius)).perform(replaceText(String.valueOf("10000")));
        onView(withId(R.id.max_search_results)).perform(typeText(String.valueOf("5000")));
        onView(withId(R.id.save_options)).perform(click());
        onView(withText("Max search results must be between 1 and 100")).check(matches(isDisplayed()));
        onView(withText("Ok")).perform(click());
    }
}