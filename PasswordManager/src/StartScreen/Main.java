package StartScreen;

import DatabaseManager.DatabaseManager;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage startStage) throws Exception{
        DatabaseManager dbm = DatabaseManager.getInstance();
        Parent root = FXMLLoader.load(getClass().getResource("StartScreen.fxml"));
        startStage.setTitle("Password Manager");
        startStage.setScene(new Scene(root, 300, 275));
        startStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
