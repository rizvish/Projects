package com.example.cmsc355.hungr;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;

public class ErrorMessage extends DialogFragment {

    static ErrorMessage newInstance(String error) {
        ErrorMessage errorFragment = new ErrorMessage();
        Bundle args = new Bundle();
        args.putString("error", error);
        errorFragment.setArguments(args);
        return errorFragment;
    }

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setMessage(getArguments().getString("error"))
                .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {

                    }
                });
        return builder.create();
    }
}