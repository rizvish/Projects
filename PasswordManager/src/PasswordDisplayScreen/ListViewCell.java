package PasswordDisplayScreen;

import javafx.scene.control.ListCell;
import javafx.scene.text.Text;

import java.awt.*;

/**
 * Created by Zac Conner on 4/19/2017.
 */
public class ListViewCell extends ListCell<String>{
    @Override
    public void updateItem(String string, boolean empty) {
        super.updateItem(string,empty);
        Text t = new Text();
        if (string != null) {
            t.setText(string);
            setGraphic(t);
        }
    }
}
