package com.example.cmsc355.hungr.settings;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.cmsc355.hungr.MainActivity;
import com.example.cmsc355.hungr.R;

import java.util.ArrayList;
import java.util.Iterator;

/*
    Adapted from the example code provided by
    http://www.mysamplecode.com/2012/07/android-listview-checkbox-example.html
    Modified significantly for this application, but is not entirely the work of this group.

    Yelp API V2 Category List
    https://www.yelp.com/developers/documentation/v2/category_list
 */

public class SelectCategoryActivity extends AppCompatActivity {

    RestaurantCategoryAdapter categoryAdapter = null;
    ArrayList<String> searchCategories;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_category_settings);

        searchCategories = getIntent().getStringArrayListExtra("categories");

        showCategoryListView();
        setButtonClickListener();
    }

    private void showCategoryListView() {

        ArrayList<RestaurantCategory> categoryList = new ArrayList<RestaurantCategory>();

        RestaurantCategory category;
        category = new RestaurantCategory("asianfusion", "Asian Fusion", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("bbq", "Barbeque", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("buffets", "Buffets", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("burgers", "Burgers", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("chinese", "Chinese", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("french", "French", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("halal", "Halal", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("indpak", "Indian", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("japanese", "Japanese", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("korean", "Korean", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("latin", "Latin American", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("mexican", "Mexican", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("pizza", "Pizza", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("thai", "Thai", false);
        setPreviouslyChecked(category);
        categoryList.add(category);
        category = new RestaurantCategory("vegan", "Vegan", false);
        setPreviouslyChecked(category);
        categoryList.add(category);

        categoryAdapter = new RestaurantCategoryAdapter(
                this, R.layout.settings_categories_info,
                categoryList);

        ListView listView = (ListView) findViewById(R.id.categoryListView);
        listView.setAdapter(categoryAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> parent,
                                    View view,
                                    int position,
                                    long id) {
                // When clicked, show a toast with the TextView text
                RestaurantCategory category = (RestaurantCategory)
                        parent.getItemAtPosition(position);

                /*
                Toast.makeText(getApplicationContext(),
                        "Clicked on Row: " + category.getName(),
                        Toast.LENGTH_LONG).show();
                */
            }
        });
    }

    private void setPreviouslyChecked(RestaurantCategory restaurant) {
        Iterator categoryIter = searchCategories.iterator();
        String categoryString;
        while (categoryIter.hasNext()) {
            categoryString = (String)categoryIter.next();
            if (categoryString.equals(restaurant.getCode())) {
                restaurant.setChecked(true);
            }
        }
    }

    private void setButtonClickListener() {

        Button selectCategoriesButton = (Button) findViewById(R.id.selectCategoriesButton);
        selectCategoriesButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {

                StringBuffer responseText = new StringBuffer();
                responseText.append("The following were selected...\n");

                ArrayList<RestaurantCategory> categoryList = categoryAdapter.categoryList;
                for (int i = 0; i < categoryList.size(); i++) {
                    RestaurantCategory category = categoryList.get(i);
                    if (category.isChecked()) {
                        searchCategories.add(category.getCode());
                        responseText.append("\n" + category.getName());
                    } else {
                        if (searchCategories.contains(category.getCode())) {
                                searchCategories.remove(category.getCode());
                            }
                    }

                }

                /*
                Toast.makeText(getApplicationContext(),
                        responseText, Toast.LENGTH_LONG).show();
                */

                Intent returnOptions = new Intent();
                returnOptions.putStringArrayListExtra("categories", searchCategories);
                setResult(RESULT_OK, returnOptions);
                finish();
            }
        });
    }

    private class RestaurantCategoryAdapter extends ArrayAdapter<RestaurantCategory> {

        private ArrayList<RestaurantCategory> categoryList;

        public RestaurantCategoryAdapter(Context context, int textViewResourceId,
                                         ArrayList<RestaurantCategory> categoryList) {

            super(context, textViewResourceId, categoryList);
            this.categoryList = new ArrayList<RestaurantCategory>();
            this.categoryList.addAll(categoryList);
        }

        private class ViewHolder {
            TextView code;
            CheckBox name;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {

            RestaurantCategoryAdapter.ViewHolder viewHolder = null;
            //Log.v("ConvertView", String.valueOf(position));

            if (convertView == null) {

                LayoutInflater viewInflater = (LayoutInflater)getSystemService(
                        Context.LAYOUT_INFLATER_SERVICE);

                convertView = viewInflater.inflate(R.layout.settings_categories_info, null);

                viewHolder = new RestaurantCategoryAdapter.ViewHolder();
                viewHolder.code = (TextView) convertView.findViewById(R.id.categoryCode);
                viewHolder.name = (CheckBox) convertView.findViewById(R.id.categoryBox1);
                convertView.setTag(viewHolder);

                viewHolder.name.setOnClickListener( new View.OnClickListener() {
                    public void onClick(View view) {
                        CheckBox box = (CheckBox) view;
                        RestaurantCategory category = (RestaurantCategory) box.getTag();
                        /*
                        Toast.makeText(getApplicationContext(),
                                "Clicked on Checkbox: " + box.getText() +
                                        " is " + box.isChecked(),
                                Toast.LENGTH_LONG).show();
                        */
                        category.setChecked(box.isChecked());
                    }
                });
            } else {
                viewHolder = (RestaurantCategoryAdapter.ViewHolder) convertView.getTag();
            }

            RestaurantCategory category = categoryList.get(position);
            viewHolder.code.setText(" (" +  category.getCode() + ")");
            viewHolder.name.setText(category.getName());
            viewHolder.name.setChecked(category.isChecked());
            viewHolder.name.setTag(category);

            return convertView;
        }
    }
}
