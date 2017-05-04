package com.example.cmsc355.hungr;

import static com.example.cmsc355.hungr.MainActivity.REQUEST_SETTINGS_CHANGE;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;



import com.example.cmsc355.hungr.settings.RestaurantCategory;
import com.example.cmsc355.hungr.settings.SelectCategoryActivity;

import java.util.ArrayList;

public class SearchSettingsActivity extends AppCompatActivity {

    static final int MAX_SEARCH_RADIUS = 40000;
    static final int MAX_SEARCH_RESULTS = 100;

    private ArrayList<String> searchCategories;
    private boolean dealsOnlySetting;
    private int searchRadiusSetting;
    private int maxResultsSetting;
    public String errorMessage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.search_settings_activity);

        /*
            System.out.println(getIntent().getBooleanExtra(MainActivity.DEALS_ONLY_SETTING, false));
            System.out.println(getIntent().getIntExtra(MainActivity.SEARCH_RADIUS_SETTING, 25));
            System.out.println(getIntent().getIntExtra(MainActivity.MAX_RESULTS_SETTING, 10));
        */

        searchCategories = getIntent().getStringArrayListExtra(MainActivity.SEARCH_CATEGORIES);
        dealsOnlySetting = getIntent().getBooleanExtra(MainActivity.DEALS_ONLY_SETTING, false);
        searchRadiusSetting = getIntent().getIntExtra(MainActivity.SEARCH_RADIUS_SETTING, 25);
        maxResultsSetting = getIntent().getIntExtra(MainActivity.MAX_RESULTS_SETTING, 20);

        Switch dealOnly = (Switch) findViewById(R.id.deals_only_switch);
        EditText radiusText = (EditText)findViewById(R.id.search_radius);
        EditText resultsText = (EditText)findViewById(R.id.max_search_results);
        dealOnly.setChecked(dealsOnlySetting);
        radiusText.setHint(String.valueOf(searchRadiusSetting));
        resultsText.setHint(String.valueOf(maxResultsSetting));
    }

    public void saveOptions(View view) {

        Intent returnOptions = new Intent();
        int returnRadius;
        int returnResults;
        boolean errorFlag = false;

        Switch dealOnly = (Switch)findViewById(R.id.deals_only_switch);
        EditText radiusText = (EditText)findViewById(R.id.search_radius);
        EditText resultsText = (EditText)findViewById(R.id.max_search_results);

        // Not implemented yet, will change into drop-down menus
        EditText categoryText = (EditText)findViewById(R.id.restaurant_category);
        EditText sortText = (EditText)findViewById(R.id.sorting_mode);

        returnOptions.putExtra(MainActivity.DEALS_ONLY_SETTING, dealOnly.isChecked());
        if (radiusText.getText().toString().equals("")) {
            returnOptions.putExtra(MainActivity.SEARCH_RADIUS_SETTING, searchRadiusSetting);
        } else {
            returnRadius = Integer.parseInt(radiusText.getText().toString());
            returnOptions.putExtra(MainActivity.SEARCH_RADIUS_SETTING, returnRadius);
            if (returnRadius <= 0 | returnRadius > MAX_SEARCH_RADIUS) {
                errorFlag = true;
                errorMessage = "Search Radius must be between 1 and " + MAX_SEARCH_RADIUS;
                DialogFragment errorFragment = ErrorMessage.newInstance(errorMessage);
                errorFragment.show(getFragmentManager(), "radius_error");
            }
        }

        if (resultsText.getText().toString().equals("")) {
            returnOptions.putExtra(MainActivity.MAX_RESULTS_SETTING, maxResultsSetting);
        } else {
            returnResults = Integer.parseInt(resultsText.getText().toString());
            returnOptions.putExtra(MainActivity.MAX_RESULTS_SETTING, returnResults);
            if (returnResults <= 0 | returnResults > MAX_SEARCH_RESULTS) {
                errorFlag = true;
                errorMessage = "Max search results must be between 1 and " + MAX_SEARCH_RESULTS;
                DialogFragment errorFragment = ErrorMessage.newInstance(errorMessage);
                errorFragment.show(getFragmentManager(), "search_results_error");
            }
        }

        returnOptions.putStringArrayListExtra(MainActivity.SEARCH_CATEGORIES, searchCategories);

        setResult(RESULT_OK, returnOptions);

        if (!errorFlag) {
            finish();
        }
    }

    public void cancelOptions(View view) {
        finish();
    }

    public void selectCategories(View view) {
        Intent categoryIntent = new Intent(this, SelectCategoryActivity.class);
        categoryIntent.putStringArrayListExtra(MainActivity.SEARCH_CATEGORIES, searchCategories);
        startActivityForResult(categoryIntent, REQUEST_SETTINGS_CHANGE);
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_SETTINGS_CHANGE) {
            if (resultCode == RESULT_OK) {
                searchCategories = data.getStringArrayListExtra(MainActivity.SEARCH_CATEGORIES);
            }
        }
    }
}
