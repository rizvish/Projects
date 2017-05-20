package com.example.cmsc355.hungr.settings;

public class RestaurantCategory {

    private String code = null;
    private String name = null;
    private boolean checked = false;

    public RestaurantCategory(String code, String name, boolean checked) {
        super();
        this.code = code;
        this.name = name;
        this.checked = checked;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

}
