package com.example.cmsc355.hungr;

import android.Manifest;
import android.app.DialogFragment;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.EditText;
import android.widget.Toast;

import com.example.cmsc355.hungr.settings.SelectCategoryActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Iterator;


public class MainActivity extends AppCompatActivity {

    static final int REQUEST_SETTINGS_CHANGE = 1;
    static final int REQUEST_CATEGORIES_CHANGE = 2;
    static final String SEARCH_CATEGORIES = "categories";
    static final String DEALS_ONLY_SETTING = "deals";
    static final String SEARCH_RADIUS_SETTING = "radius";
    static final String MAX_RESULTS_SETTING = "results";

    private ArrayList<String> searchCategories = new ArrayList<String>();
    private boolean dealsOnlySetting = false;
    private int searchRadiusSetting = 40000;
    private int maxResultsSetting = 20;

    private JSONArray masterArray;
    private JSONArray mockMasterArray;
    private int businessCount;
    private int debug = 1;
    private boolean testingNetwork = false;
    private boolean testingRemoteLocation = false;

    private double lati = 32;
    private double longi = -110;
    double[] coordinates;

    /*
        For testing purposes only.
        0 = no effect
        1 = address and review fields changed for testing
     */
    private int testVar;

    public void setTestVar(int num) {
        this.testVar = num;
    }

    public void setMockMasterArray(String name) {
        try {
            this.mockMasterArray = new JSONArray(name);
        } catch (Exception exception) {
            System.out.println("Fail 7.");
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
    }

    /*
        Get Food button click handling.
        Checks internet connection.
        If available, pings yelp API
        and starts ShowRecommendationsActivity
        Else, makes toast explaining problem.
     */
    public void onGetFoodButtonClick(View view) {
        if (view.getId() == R.id.getFoodButton) {
            if (validNetworkConnection()) {
                int checkPerm = ActivityCompat.checkSelfPermission(getApplicationContext(),
                        Manifest.permission.ACCESS_FINE_LOCATION);
                if (checkPerm == PackageManager.PERMISSION_GRANTED) {

                    LocationManager locationManager;
                    locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
                    Criteria criteria = new Criteria();
                    String provider = locationManager.getBestProvider(criteria, false);

                    LocationListener locationListener = new LocationListener() {
                        @Override
                        public void onLocationChanged(Location location) {

                        }

                        @Override
                        public void onStatusChanged(String provider, int status, Bundle extras) {

                        }

                        @Override
                        public void onProviderEnabled(String provider) {

                        }

                        @Override
                        public void onProviderDisabled(String provider) {

                        }
                    };

                    locationManager.requestLocationUpdates(provider, 0, 0, locationListener);

                    Location location = locationManager.getLastKnownLocation(provider);

                    try {
                        double latitude = location.getLatitude();
                        double longitude = location.getLongitude();
                        String latLonStr = concatenateLatLon(latitude, longitude);
                        System.out.println(latLonStr);
                        coordinates = new double[2];
                        coordinates[0] = latitude;
                        coordinates[1] = longitude;
                    } catch (Exception ex) {
                        System.out.println("A value was null..");
                    }
                }

                view.startAnimation(AnimationUtils.loadAnimation(this, R.anim.anim_rotate));
                PingYelpApi yelpRef = new PingYelpApi();
                yelpRef.execute();
            } else {
                String errorMessage = "No internet connection";
                DialogFragment errorFragment = ErrorMessage.newInstance(errorMessage);
                errorFragment.show(getFragmentManager(), "no_internet_error");
            }
        }
    }

    public boolean validNetworkConnection() {
        ConnectivityManager connectivityManager;
        connectivityManager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
        return !testingNetwork && (networkInfo != null && networkInfo.isConnected());
    }

    public void setNetworkTestingFlag(boolean flag) {
        testingNetwork = flag;
    }

    public void setRemoteLocationTestingFlag(boolean flag) {
        testingRemoteLocation = flag;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        if (id == R.id.search_options) {
            Intent settingsIntent = new Intent(this, SearchSettingsActivity.class);
            settingsIntent.putStringArrayListExtra(SEARCH_CATEGORIES, searchCategories);
            settingsIntent.putExtra(DEALS_ONLY_SETTING, dealsOnlySetting);
            settingsIntent.putExtra(SEARCH_RADIUS_SETTING, searchRadiusSetting);
            settingsIntent.putExtra(MAX_RESULTS_SETTING, maxResultsSetting);
            startActivityForResult(settingsIntent, REQUEST_SETTINGS_CHANGE);
        }
        if (id == R.id.categories_options) {
            Intent categoryIntent = new Intent(this, SelectCategoryActivity.class);
            categoryIntent.putStringArrayListExtra(SEARCH_CATEGORIES, searchCategories);
            startActivityForResult(categoryIntent, REQUEST_CATEGORIES_CHANGE);
        }
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_SETTINGS_CHANGE) {
            if (resultCode == RESULT_OK) {
                searchCategories = data.getStringArrayListExtra(SEARCH_CATEGORIES);
                dealsOnlySetting = data.getBooleanExtra(DEALS_ONLY_SETTING, false);
                searchRadiusSetting = data.getIntExtra(SEARCH_RADIUS_SETTING, 0);
                maxResultsSetting = data.getIntExtra(MAX_RESULTS_SETTING, 0);
            }
        }
        if (requestCode == REQUEST_CATEGORIES_CHANGE) {
            if (resultCode == RESULT_OK) {
                searchCategories = data.getStringArrayListExtra(SEARCH_CATEGORIES);
            }
        }
    }

    public void setCoordinates(double v0, double v1) {
        this.lati = v0;
        this.longi = v1;
    }

    public JSONArray getMasterArray() {
        return masterArray;
    }

    /*
        Async task and doInBackground are used to ping the API.
        Running such a task on the main thread would cause the app to crash.
     */
    private class PingYelpApi extends AsyncTask<String, String, String> {

        //Send in API keys and ping the API
        @Override
        protected String doInBackground(String... params) {
            final String consumerKey = "CONSUMER_KEY";
            final String consumerSecret = "CONSUMER_SECRET";
            final String token = "TOKEN";
            final String tokenSecret = "TOKEN_SECRET";

            YelpApi yelpRef = new YelpApi(getYelpApiParams(consumerKey),
                    getYelpApiParams(consumerSecret),
                    getYelpApiParams(token),
                    getYelpApiParams(tokenSecret));

            String searchResults = "";
            JSONArray tempArray;
            masterArray = new JSONArray();

            if (!searchCategories.isEmpty()) {
                Iterator searchIter = searchCategories.iterator();
                String searchCategory;
                String yelpSearchResult;
                while (searchIter.hasNext()) {
                    searchCategory = (String)searchIter.next();
                    System.out.println("Searching for: " + searchCategory);
                    yelpSearchResult = yelpRef.searchForBusinessesByCoordinates(
                            searchCategory, lati, longi, searchRadiusSetting);
                    /*
                        Because JSON Objects are represented by an enclosed [ ] notation,
                        this does not allow String.concat to work properly. Here we
                        are merging all the results into the masterArray.
                     */
                    try {
                        JSONObject tempJson = new JSONObject(yelpSearchResult);
                        tempArray = tempJson.getJSONArray("businesses");
                        masterArray = concatenateJsonArrays(masterArray, tempArray);
                    } catch (JSONException ex) {
                        System.out.println(ex.getMessage());
                    }
                }
            } else {
                searchResults = yelpRef.searchForBusinessesByCoordinates("food", lati,
                        longi, searchRadiusSetting);

                try {
                    JSONObject tempJson = new JSONObject(searchResults);
                    masterArray = tempJson.getJSONArray("businesses");
                } catch (JSONException ex) {
                    System.out.println(ex.getMessage());
                }
            }
            return searchResults;
        }

        @Override
        protected void onPostExecute(String str) {
            super.onPostExecute(str);

            if (apiHasError(str)) {
                Toast.makeText(getApplicationContext(),
                        "No restaurants nearby",
                        Toast.LENGTH_SHORT).show();
            }

            //Get the JSONObject returned from doInBackground,
            //and save from it the businesses JSONArray

            //This is now done in the doInBackground function, because
            //String concatenation with JSONObjects from the YelpApi
            //was not working properly.

            //JSONObject tempJson = new JSONObject(str);
            //masterArray = tempJson.getJSONArray("businesses");

            //Calculate the amount of businesses returned in the JSONArray
            setBusinessCount();

            if (debug == 1) {
                try {
                    //System.out.println(tempJson.toString(4));
                    //System.out.println(str);
                    System.out.println(masterArray.toString(4));
                } catch (JSONException ex) {
                    System.out.println(ex.getMessage());
                }
                System.out.println(businessCount);
            }

            // Start ShowRecommendationsActivity only if
            // there is at least one business to display
            if (businessCount != 0 && testVar == 0 && !testingRemoteLocation) {
                Intent newIntent = new Intent(getApplicationContext(),
                        ShowRecommendationsActivity.class);

                //Append the businesses JSONArray as well as the business count to Intent
                Bundle extras = new Bundle();
                extras.putString("getBusinessArray", masterArray.toString());
                extras.putInt("getBusinessCount", businessCount);
                newIntent.putExtras(extras);

                //Start ShowRecommendationsActivity
                startActivity(newIntent);
            } else if (testVar == 1 && !testingRemoteLocation) {
                Bundle extras = new Bundle();
                extras.putString("getBusinessArray", mockMasterArray.toString());
                setBusinessCount();
                extras.putInt("getBusinessCount", businessCount);
                Intent newIntent = new Intent(getApplicationContext(),
                        ShowRecommendationsActivity.class);
                newIntent.putExtras(extras);
                startActivity(newIntent);
            } else {
                String errorMessage = "No restaurants nearby";
                DialogFragment errorFragment = ErrorMessage.newInstance(errorMessage);
                errorFragment.show(getFragmentManager(), "no_restaurants_error");
            }
        }

    }
    // Unit Test 3

    public JSONArray concatenateJsonArrays(JSONArray... jsonArrays) throws JSONException {
        JSONArray result = new JSONArray();
        for (JSONArray singleArray : jsonArrays) {
            for (int i = 0; i < singleArray.length(); i++) {
                result.put(singleArray.get(i));
            }
        }
        return result;
    }
    //Calculates the amount of businesses returned in the JSONArray

    public void setBusinessCount() {
        businessCount = 0;
        if (testingRemoteLocation) {
            return;
        }
        int end;
        if (testVar == 0) {
            end = masterArray.length();
        } else {
            end = mockMasterArray.length();
        }

        try {
            for (int i = 0; i < end; i++) {
                if (testVar == 0 && masterArray.getJSONObject(i) == null) {
                    break;
                }
                if (testVar == 1 && mockMasterArray.getJSONObject(i) == null) {
                    break;
                }
                businessCount++;
            }
        } catch (JSONException ex) {
            System.out.println("Exception in setBusinessCount");
            System.out.println(ex.getMessage());
        }
    }

    public int getBusinessCount() {
        return businessCount;
    }

    // Unit Test
    public String concatenateLatLon(double latitude, double longitude) {
        String latitudeStr = String.valueOf(latitude);
        String longitudeStr = String.valueOf(longitude);
        String latLonStr = latitudeStr + "," + longitudeStr;
        return latLonStr;
    }

    // Unit Test
    public boolean apiHasError(String str) {
        if (str.equals("{\"error\": {\"text\": \"API unavailable in this location\", "
                + "\"id\": \"UNAVAILABLE_FOR_LOCATION\"}}")) {
            return true;
        } else if (str.equals("")) {
            return true;
        } else if (str.equals(""
                + "{\"error\": {\"text\": \"Business information is unavailable\","
                + " \"id\": \"BUSINESS_UNAVAILABLE\"}}")) {
            return true;
        }
        return false;
    }

    // Unit Test 9
    public String getYelpApiParams(String key) {
        if (key.equals("CONSUMER_KEY")) {
            return "4gMlTiNc9lXpqP9YIwmbJg";
        }
        if (key.equals("CONSUMER_SECRET")) {
            return "yKuJ3AV6pkw4ITB4WBfHuZq-JL0";
        }
        if (key.equals("TOKEN")) {
            return "Eeiax8f5iIYnh6IMWmHLVTKYWSGATfr1";
        }
        if (key.equals("TOKEN_SECRET")) {
            return "FtZpcHv3NFy3gKd-XxvvSDmN3Gk";
        }
        return null;
    }
}