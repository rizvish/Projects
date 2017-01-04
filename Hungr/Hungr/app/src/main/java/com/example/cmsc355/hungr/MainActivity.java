package com.example.cmsc355.hungr;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.*;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {

    private JSONArray masterArray;
    private int businessCount;
    private int debug = 1;
    private boolean testingNetwork = false;
    private boolean testingRemoteLocation = false;

    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 1);
        ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_COARSE_LOCATION}, 1);
        LocationManager locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);
        LocationListener locationListener = new LocationListener();

        if (ContextCompat.checkSelfPermission(getApplicationContext(),
                Manifest.permission.ACCESS_FINE_LOCATION)
                == PackageManager.PERMISSION_GRANTED) {


            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 5000, 0, locationListener);
            System.out.println(locationListener.retLatitude());
            System.out.println(locationListener.retLongitude());


        }
    }
    /*
        Get Food button click handling.
        Checks internet connection. If available, pings yelp API and starts ShowRecommendationsActivity
        Else, makes toast explaining problem.
     */
    public void onGetFoodButtonClick(View v){
        if (v.getId() == R.id.getFoodButton){
            if (validNetworkConnection()) {
                pingYelpAPI yelpRef = new pingYelpAPI();
                yelpRef.execute();
            }
            else Toast.makeText(this, "No internet connection", Toast.LENGTH_SHORT).show();
        }
    }

    public boolean validNetworkConnection() {
        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
        return !testingNetwork && (networkInfo != null && networkInfo.isConnected());
    }

    public void disableNetworkForTesting() {
        testingNetwork = true;
    }

    public void setRemoteLocationForTesting() {
        testingRemoteLocation = true;
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

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    /*
        Async task and doInBackground are used to ping the API.
        Running such a task on the main thread would cause the app to crash.
     */
    private class pingYelpAPI extends AsyncTask<String, String, String>{

        //Send in API keys and ping the API
        @Override
        protected String doInBackground(String... params) {
            YelpAPI yelpRef = new YelpAPI("4gMlTiNc9lXpqP9YIwmbJg",
                    "yKuJ3AV6pkw4ITB4WBfHuZq-JL0",
                    "Eeiax8f5iIYnh6IMWmHLVTKYWSGATfr1",
                    "FtZpcHv3NFy3gKd-XxvvSDmN3Gk");

            //TO-DO: Make the location customizable
            return yelpRef.searchForBusinessesByLocation("food", "Richmond, VA");
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            try {
                //Get the JSONObject returned from doInBackground,
                //and save from it the businesses JSONArray
                JSONObject tempJSON = new JSONObject(s);
                masterArray = tempJSON.getJSONArray("businesses");
                if (debug == 1) System.out.println(masterArray.toString(4));

                //Calculate the amount of businesses returned in the JSONArray
                setBusinessCount();
                if (debug == 1) System.out.println(businessCount);

                //Start ShowRecommendationsActivity only if there is at least one business to display
                if (businessCount != 0) {
                    Intent newIntent = new Intent(getApplicationContext(), ShowRecommendationsActivity.class);

                    //Append the businesses JSONArray as well as the business count to Intent
                    Bundle extras = new Bundle();
                    extras.putString("getBusinessArray", masterArray.toString());
                    extras.putInt("getBusinessCount", businessCount);
                    newIntent.putExtras(extras);

                    //Start ShowRecommendationsActivity
                    startActivity(newIntent);
                }

                //If there is no business to display, show toast error message
                else Toast.makeText(getApplicationContext(), "No restaurants nearby", Toast.LENGTH_SHORT).show();
            } catch (JSONException e) {
                System.out.println("Fail 1");
                e.printStackTrace();
            }

        }

        //Calculates the amount of businesses returned in the JSONArray
        private void setBusinessCount(){
            businessCount = 0;
            if (testingRemoteLocation) return;
            try{
                for (int i = 0; i < 20; i++){
                    if (masterArray.getJSONObject(i) == null) break;
                    businessCount++;
                }
            }catch(JSONException e){}
        }
    }
}
