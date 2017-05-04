package com.example.cmsc355.hungr;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.Espresso.pressBack;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isChecked;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;

@RunWith(AndroidJUnit4.class)

public class SelectCategoriesTest {

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);

    @Test
    public void selectedCategoriesTest() throws JSONException{
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want the option to choose one or more categories of restaurants,
            so that when I search for restaurants the results will match my chosen categories.

            SCENARIO:
            Given that I have selected one or more categories of restaurants,
            when I click the get food button,
            then the results will return restaurants belonging to those categories.
         */

        // Select the Pizza category from the categories menu
        onView(withId(R.id.categories_options)).perform(click());
        onView(withText("Burgers")).perform(click());

        // Return to the main screen and press the get food button
        onView(withId(R.id.selectCategoriesButton)).perform(click());
        onView(withId(R.id.getFoodButton)).perform(click());

        // The master array in the main activity contains all the search results.
        JSONArray testingMasterArray = mActivityRule.getActivity().getMasterArray();
        JSONObject firstBusiness = (JSONObject) testingMasterArray.get(0);
        JSONArray firstBusinessCategories = (JSONArray) firstBusiness.get("categories");
        String firstCategory = firstBusinessCategories.get(0).toString();

        // Make sure the category matches our initial selection of pizza.
        assert(firstCategory.contains("Burgers"));
    }

    public void noCategoriesTest() throws JSONException {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want the option to choose one or more categories of restaurants,
            so that when I search for restaurants the results will match my chosen categories.

            SCENARIO:
            Given that I have not selected any categories of restaurants,
            when I click the get food button,
            then the results will return all types of restaurants.
         */

        // Do an initial search, with no categories.
        onView(withId(R.id.getFoodButton)).perform(click());
        JSONArray testingMasterArray = mActivityRule.getActivity().getMasterArray();
        JSONObject firstBusiness = (JSONObject) testingMasterArray.get(0);
        JSONArray firstBusinessCategories = (JSONArray) firstBusiness.get("categories");
        String firstSearchCategory = firstBusinessCategories.get(0).toString();

        // Return to the main screen
        pressBack();

        // Go to the categories menu and select three options
        onView(withId(R.id.categories_options)).perform(click());
        onView(withText("Asian Fusion")).perform(click());
        onView(withText("Barbeque")).perform(click());
        onView(withText("Buffets")).perform(click());

        // Return to the main screen
        onView(withId(R.id.selectCategoriesButton)).perform(click());

        // Now return and deselect the three options
        onView(withId(R.id.categories_options)).perform(click());
        onView(withText("Asian Fusion")).perform(click());
        onView(withText("Barbeque")).perform(click());
        onView(withText("Buffets")).perform(click());

        // Return to the main screen
        onView(withId(R.id.selectCategoriesButton)).perform(click());

        // Now check that the same initial search categories match
        onView(withId(R.id.getFoodButton)).perform(click());
        testingMasterArray = mActivityRule.getActivity().getMasterArray();
        firstBusiness = (JSONObject) testingMasterArray.get(0);
        firstBusinessCategories = (JSONArray) firstBusiness.get("categories");
        String secondSearchCategory = firstBusinessCategories.get(0).toString();
        assert(firstSearchCategory.equals(secondSearchCategory));
    }

    @Test
    public void savedSettingsTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want the option to choose one or more categories of restaurants,
            so that when I search for restaurants the results will match my chosen categories.

            SCENARIO:
            Given that I have previously selected one or more categories of restaurants,
            when I return to the options menu containing the list of categories,
            then I will be able to see my previously selected categories.
         */

        // Go to the categories menu and select three options
        onView(withId(R.id.categories_options)).perform(click());
        onView(withText("Asian Fusion")).perform(click());
        onView(withText("Barbeque")).perform(click());
        onView(withText("Buffets")).perform(click());

        // Return to the main screen
        onView(withId(R.id.selectCategoriesButton)).perform(click());

        // Now return again to the categories menu to verify.
        onView(withId(R.id.categories_options)).perform(click());
        onView(withText("Asian Fusion")).check(matches(isChecked()));
        onView(withText("Barbeque")).check(matches(isChecked()));
        onView(withText("Buffets")).check(matches(isChecked()));
    }
}