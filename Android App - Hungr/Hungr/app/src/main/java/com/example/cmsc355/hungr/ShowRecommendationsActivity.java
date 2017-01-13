package com.example.cmsc355.hungr;

import com.google.android.gms.maps.model.LatLng;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.Toolbar;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;



import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.NoSuchElementException;

public class ShowRecommendationsActivity
        extends FragmentActivity
        implements GestureDetector.OnGestureListener {

    private JSONArray masterArray;
    private ViewPager pager;
    private PagerAdapter pagerAdapter;
    private GestureDetector gestureDetector;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_pager);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        //Set the pager and pager adapater for use with swipeable panes
        pager = (ViewPager) findViewById(R.id.view_pager);
        pagerAdapter = new ShowRecommendationsAdapter(getSupportFragmentManager());
        pager.setAdapter(pagerAdapter);

        Bundle extras = getIntent().getExtras();
        try {
            //Copy over the masterArray from the Intent extras
            masterArray = new JSONArray(extras.getString("getBusinessArray"));

        } catch (JSONException ex) {
            System.out.println("Fail 2");
            ex.printStackTrace();
        }

        //Create the GestureDector and set it to this layout
        gestureDetector = new GestureDetector(this);
        findViewById(R.id.view_pager).setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent event) {
                return gestureDetector.onTouchEvent(event);
            }
        });
    }
    // Overrides for Gesture Detector

    @Override
    public boolean onDown(MotionEvent motionEvent) {
        return true;
    }

    @Override
    public void onShowPress(MotionEvent motionEvent) {

    }

    @Override
    public boolean onSingleTapUp(MotionEvent motionEvent) {
        return false;
    }

    @Override
    public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent1, float v1, float v2) {
        return false;
    }

    @Override
    public void onLongPress(MotionEvent motionEvent) {

    }

    public void mockitoScrollDown(View view) {
        Intent newIntent = new Intent(this, ShowRecommendationInfoActivity.class);
        ShowRecommendationsAdapter showRecommendationsAdapter =
                new ShowRecommendationsAdapter(getSupportFragmentManager());
        int position = pager.getCurrentItem();
        try {
            newIntent.putExtra("getBusinessArray", masterArray.getJSONObject(position).toString());
        } catch (Exception exception) {
            System.out.println("Fail 5");
        }
        startActivity(newIntent);
    }

    @Override
    public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent1, float v1, float v2) {
        if (motionEvent.getY() - motionEvent1.getY() > 100 && Math.abs(v1) > 50) {
            Intent newIntent = new Intent(this, ShowRecommendationInfoActivity.class);
            ShowRecommendationsAdapter showRecommendationsAdapter =
                    new ShowRecommendationsAdapter(getSupportFragmentManager());
            int position = pager.getCurrentItem();
            try {
                newIntent.putExtra("getBusinessArray",
                        masterArray.getJSONObject(position).toString());
            } catch (Exception exception) {
                System.out.println("Fail 5");
            }
            startActivity(newIntent);
            return true;
        }
        return false;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        this.gestureDetector.onTouchEvent(event);
        return super.onTouchEvent(event);
    }

    private class ShowRecommendationsAdapter extends FragmentStatePagerAdapter {
        private int position;

        //Sets the fragment manager
        public ShowRecommendationsAdapter(FragmentManager fm) {
            super(fm);
        }

        //Gets the current item (pane) which is calculated in the background
        //by the adapter, and sets values in the initialized fragment
        //See 'ShowRecommendationsFragment' to see what's done with set values
        @Override
        public Fragment getItem(int position) {
            this.position = position;
            ShowRecommendationsFragment newPane = new ShowRecommendationsFragment();
            try {
                String restaurantName = masterArray.getJSONObject(position).get("name").toString();
                newPane.setRestaurantName(restaurantName);
                newPane.setUrl(masterArray.getJSONObject(position).get("image_url").toString());
                LatLng ll;
                try {
                    JSONObject coord = masterArray.getJSONObject(position)
                            .getJSONObject("location")
                            .getJSONObject("coordinate");
                    ll = new LatLng(coord.getDouble("latitude"), coord.getDouble("longitude"));

                } catch (NoSuchElementException ex) {
                    //If no valid location data
                    ll = null;
                }
                newPane.setLoc(ll);

            } catch (Exception ex) {
                System.out.println("Exception");
            }
            return newPane;
        }

        public int getPosition() {
            return this.position;
        }

        //Method used in the adapater automatically sets
        //the amount of panes to be displayed
        @Override
        public int getCount() {
            Bundle extras = getIntent().getExtras();
            return extras.getInt("getBusinessCount");
        }
    }

}
