package com.example.cmsc355.hungr;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.RootMatchers.withDecorView;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.not;

@RunWith(AndroidJUnit4.class)

public class NetworkProblemsTest {

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);

    private NetworkConnectionIdlingResource networkIdlingResource;

    @Before
    public void disableInternetConnection() {
        /*

        NOTE: Not working. Leaving here until a decision is made to pursue this.

        WifiManager wifiManager = (WifiManager) mActivityRule.getActivity().getBaseContext().getSystemService(Context.WIFI_SERVICE);
        ConnectivityManager connectivityManager = (ConnectivityManager) mActivityRule.getActivity().getSystemService(Context.CONNECTIVITY_SERVICE);
        networkIdlingResource = new NetworkConnectionIdlingResource(connectivityManager);
        Espresso.registerIdlingResources(networkIdlingResource);
        setMobileDataEnabled(connectivityManager, false);
        try {
            Process process = Runtime.getRuntime().exec("adb shell svc data disable");
            BufferedReader bufferedReader = new BufferedReader(
                    new InputStreamReader(process.getInputStream()));
        } catch (IOException e) {}
        */
    }

    @After
    public void unregisterIdlingResource() {
        //Espresso.unregisterIdlingResources(networkIdlingResource);
    }

    @Test
    public void buttonPressNoInternet() {
        /*
            Instrumentation Test for the user story:
            As a basic user, I want a button to click,
            so that I can get a recommendation for a restaurant to eat at.

            SCENARIO:
            Given that I have a poor internet connection,
            when I click the button,
            then I need to receive an error message explaining what went wrong.
         */
        mActivityRule.getActivity().setNetworkTestingFlag(true);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withText("No internet connection"))
                .inRoot(withDecorView(not(mActivityRule.getActivity().getWindow().getDecorView())))
                .check(matches((isDisplayed())));
        mActivityRule.getActivity().setNetworkTestingFlag(false);
    }
}

