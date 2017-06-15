package PasswordDisplayScreen;

import DatabaseManager.DatabaseManager;
import Encryptor.Encryptor;
import SessionManager.SessionManager;
import com.sun.org.apache.xml.internal.dtm.ref.sax2dtm.SAX2DTM2;
import javafx.application.Platform;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.*;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.util.Callback;
import javafx.util.Pair;

import javax.swing.plaf.nimbus.State;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

/**
 * Created by Kyle on 4/15/2017.
 */

public class PDSController {
    @FXML
    private VBox passwordBox = new VBox();
    @FXML
    private ListView<String> passwordList = new ListView<>();
    @FXML
    private Parent root;

    private DatabaseManager dbm = DatabaseManager.getInstance();
    SessionManager sessionManager = SessionManager.getInstance();
    Encryptor encryptor = Encryptor.getInstance();
    private String username = sessionManager.getUsername();
    private Stage lastStage = sessionManager.getLastStage();

    private Statement statement;
    private ResultSet resultSet;

    private ObservableList<String> passwords = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        try {
            statement = dbm.getConnection().createStatement();
            String query = "SELECT NAME, PW FROM " + username;
            resultSet = statement.executeQuery(query);
            passwords.clear();
            passwordBox.getChildren().clear();
            passwordBox.getChildren().add(passwordList);

            String currentString;
            String currentName;
            while (resultSet.next()) {
                currentName = resultSet.getString("NAME");
                currentString = encryptor.getEncryptionTool().decrypt(resultSet.getString("PW"));
                if (currentString != null) {
                    passwords.add(currentName + " , " + currentString);
                }
            }

            passwordList.setItems(passwords);
            for (String password : passwords) {
                System.out.println(password);
            }

            passwordList.setCellFactory(new Callback<ListView<String>,
                ListCell<String>>() {
                    @Override
                    public ListCell<String> call(ListView<String> list) {
                        return new ListViewCell();
                    }
                }
            );

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleAddPasswordButton(ActionEvent actionEvent) {
        Pair<String, String> entry = getNewPasswordPrompt();

        if (entry != null) {
            String encryptedEntry = encryptor.getEncryptionTool().encrypt(entry.getValue());
            System.out.println(encryptedEntry);
            try {
                statement = dbm.getConnection().createStatement();
                String newPassUpdate = "INSERT INTO " + username + " (NAME,PW) VALUES ('" + entry.getKey() + "', '" + encryptedEntry + "')";
                statement.executeUpdate(newPassUpdate);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Bring up window saying it wasn't added
        }
        initialize();
    }

    public void handleDeletePasswordButton(ActionEvent actionEvent) {
        String currentPw = passwordList.getSelectionModel().getSelectedItem();
        try {
            statement = dbm.getConnection().createStatement();
            String newPassUpdate = "DELETE FROM " + username + " WHERE NAME = '" + currentPw.substring(0, currentPw.indexOf(' ')) + "'";
            System.out.print(newPassUpdate);
            statement.executeUpdate(newPassUpdate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        initialize();
    }

    public void handleLogoutButton(ActionEvent actionEvent)  {
        Stage currentStage = (Stage) root.getScene().getWindow();
        currentStage.hide();

        SessionManager session1 = SessionManager.getInstance();
        session1.getLastStage().show();

    }

    Pair<String, String> getNewPasswordPrompt() {

        Dialog<Pair <String, String>> dialog = new Dialog();
        dialog.setTitle("Add New Password");
        dialog.setHeaderText("Enter an identifier, and your new password.");
        TextField identifier = new TextField();
        identifier.setPromptText("Identifier");
        PasswordField password = new PasswordField();
        password.setPromptText("Password");

        GridPane gridPane = new GridPane();
        gridPane.setHgap(10);
        gridPane.setVgap(10);
        gridPane.setPadding(new Insets(10, 10, 10, 10));

        gridPane.add((new Text("Identifier")), 0, 0);
        gridPane.add((new Text("Password:")), 0, 1);
        gridPane.add(identifier, 1, 0);
        gridPane.add(password, 1, 1);

        dialog.getDialogPane().getButtonTypes().addAll(ButtonType.OK, ButtonType.CANCEL);

        dialog.getDialogPane().setContent(gridPane);

        Platform.runLater(() -> identifier.requestFocus());

        dialog.setResultConverter(dialogButton -> {
            if (dialogButton == ButtonType.OK) {
                return new Pair<>(identifier.getText(), password.getText());
            }
            return null;
        });

        Node okButton = dialog.getDialogPane().lookupButton(ButtonType.OK);
        okButton.setDisable(true);

        identifier.textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                okButton.setDisable(identifier.getText().isEmpty() || password.getText().isEmpty());
            }
        });

        password.textProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                okButton.setDisable(identifier.getText().isEmpty() || password.getText().isEmpty());
            }
        });

        Optional<Pair <String, String>> result = dialog.showAndWait();

        try {
            return result.get();
        } catch (Exception e) {
            return null;
        }
    }
}
