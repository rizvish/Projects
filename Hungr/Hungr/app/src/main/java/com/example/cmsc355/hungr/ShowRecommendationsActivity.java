package com.example.cmsc355.hungr;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.InputStream;

public class ShowRecommendationsActivity extends FragmentActivity {

    private int swipeCounter;
    private JSONArray masterArray;
    private ViewPager pager;
    private PagerAdapter pagerAdapter;

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

        }catch(JSONException e){
            System.out.println("Fail 2");
            e.printStackTrace();
        }
    }

    private class ShowRecommendationsAdapter extends FragmentStatePagerAdapter{

        //Sets the fragment manager
        public ShowRecommendationsAdapter(FragmentManager fm){
            super(fm);
        }

        //Gets the current item (pane) which is calculated in the background
        //by the adapter, and sets values in the initialized fragment
        //See 'ShowRecommendationsFragment' to see what's done with set values
        @Override
        public Fragment getItem(int position) {
            ShowRecommendationsFragment newPane = new ShowRecommendationsFragment();
            try {
                newPane.setRestaurantName(masterArray.getJSONObject(position).get("name").toString());
                newPane.setURL(masterArray.getJSONObject(position).get("image_url").toString());
            }
            catch(Exception e){}
            return newPane;
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
