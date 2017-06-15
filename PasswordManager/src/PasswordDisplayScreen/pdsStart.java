package PasswordDisplayScreen;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;



/**
 * Created by Kyle on 4/15/2017.
 */


public class pdsStart{

    public void start() throws Exception {
        Stage passwordStage = new Stage();
        Parent root = FXMLLoader.load(getClass().getResource("PDS.fxml"));
        passwordStage.setTitle("Password Manager");
        passwordStage.setScene(new Scene(root, 375,275));
        passwordStage.show();

    }

}
