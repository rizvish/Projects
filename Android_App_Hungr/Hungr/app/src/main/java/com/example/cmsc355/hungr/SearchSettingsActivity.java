package com.example.cmsc355.hungr;

import static com.example.cmsc355.hungr.MainActivity.REQUEST_SETTINGS_CHANGE;
import android.app.DialogFragment;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

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

        //Switch dealOnly = (Switch) findViewById(R.id.deals_only_switch);
        //EditText radiusText = (EditText)findViewById(R.id.search_radius);
        EditText resultsText = (EditText)findViewById(R.id.max_search_results);
        //dealOnly.setChecked(dealsOnlySetting);
        //radiusText.setHint(String.valueOf(searchRadiusSetting));
        resultsText.setHint(String.valueOf(maxResultsSetting));

        //Not sure what will happen if no value is yet stored
        EditText zipCode = (EditText) findViewById(R.id.zip_code);
        SharedPreferences zipCodePrefs = getApplicationContext().getSharedPreferences("zipCode", Context.MODE_PRIVATE);
        String storedZipCode = zipCodePrefs.getString("zipCode", "");
        zipCode.setText(storedZipCode);

        //Same issue here
        EditText maxSearchResults = (EditText) findViewById(R.id.max_search_results);
        SharedPreferences maxSearchResultsPrefs = getApplicationContext().getSharedPreferences("searchLimit", Context.MODE_PRIVATE);
        String maxSearchResultsString = maxSearchResultsPrefs.getString("searchLimit", "20");
        maxSearchResults.setText(maxSearchResultsString);
    }

    public void saveOptions(View view) {

        Intent returnOptions = new Intent();
        int returnRadius;
        int returnResults;
        boolean zipCodeGood = false;
        boolean searchLimitGood = false;

        //Switch dealOnly = (Switch)findViewById(R.id.deals_only_switch);
        //EditText radiusText = (EditText)findViewById(R.id.search_radius);

        // Not implemented yet, will change into drop-down menus
        //EditText categoryText = (EditText)findViewById(R.id.restaurant_category);
        //EditText sortText = (EditText)findViewById(R.id.sorting_mode);

        //returnOptions.putExtra(MainActivity.DEALS_ONLY_SETTING, dealOnly.isChecked());
        /*
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
        */

        EditText maxResultsEntry = (EditText)findViewById(R.id.max_search_results);
        String maxResults = maxResultsEntry.getText().toString();
        SharedPreferences limitPrefs = getApplicationContext().getSharedPreferences("searchLimit", Context.MODE_PRIVATE);
        SharedPreferences.Editor limitPrefsEditor = limitPrefs.edit();

        if (limitInRange(maxResults)) {
            limitPrefsEditor.putString("searchLimit", maxResults);
            limitPrefsEditor.commit();
            searchLimitGood = true;
        } else {
            searchLimitGood = false;
            Toast.makeText(this, "Search limit must be between 1 and 20.", Toast.LENGTH_SHORT).show();
            maxResultsEntry.setText("20");
            limitPrefsEditor.putString("searchLimit", "20");
            limitPrefsEditor.commit();
        }

        returnOptions.putStringArrayListExtra(MainActivity.SEARCH_CATEGORIES, searchCategories);

        setResult(RESULT_OK, returnOptions);

        EditText zipCodeEntry = (EditText) findViewById(R.id.zip_code);
        String zipC = zipCodeEntry.getText().toString();
        SharedPreferences zipCodePrefs = getApplicationContext().getSharedPreferences("zipCode", Context.MODE_PRIVATE);
        String storedZipCode = zipCodePrefs.getString("zipCode", "");
        SharedPreferences.Editor zipCodePrefsEditor = zipCodePrefs.edit();

        if (zipC.length() == 5 && isAnInt(zipC)) {
            zipCodePrefsEditor.putString("zipCode", zipC);
            zipCodePrefsEditor.commit();
            zipCodeGood = true;
        }
        else {
            zipCodeGood = false;
            Toast.makeText(this, "Zip code must be five digits.", Toast.LENGTH_SHORT).show();
            zipCodeEntry.setText(storedZipCode);
            zipCodePrefsEditor.putString("zipCode", storedZipCode);
            zipCodePrefsEditor.commit();
        }

        if (searchLimitGood && zipCodeGood) {
            finish();
        }
    }

    public boolean limitInRange(String limit){
        try {
            int maxResults = Integer.parseInt(limit);
            if (maxResults >= 1 && maxResults <= 20) {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    public boolean isAnInt(String zipCode){
        for (int i = 0; i < zipCode.length(); i++){
            if (zipCode.charAt(i) != '0' &&
                    zipCode.charAt(i) != '1' &&
                    zipCode.charAt(i) != '2' &&
                    zipCode.charAt(i) != '3' &&
                    zipCode.charAt(i) != '4' &&
                    zipCode.charAt(i) != '5' &&
                    zipCode.charAt(i) != '6' &&
                    zipCode.charAt(i) != '7' &&
                    zipCode.charAt(i) != '8' &&
                    zipCode.charAt(i) != '9'){
                return false;
            }
        }
        return true;
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
