package StartScreen;

import DatabaseManager.DatabaseManager;
import Encryptor.Encryptor;
import PasswordDisplayScreen.pdsStart;
import SessionManager.SessionManager;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.control.TextInputDialog;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Optional;

public class SSController {
    @FXML
    private TextField usernameInput;
    @FXML
    private PasswordField passwordInput;

    @FXML
    Parent root;

    private final int MAX_STRING_INPUT_LENGTH = 50;

    private DatabaseManager dbm = DatabaseManager.getInstance();
    Encryptor encryptor = Encryptor.getInstance();
    private Statement statement;
    private ResultSet resultSet;

    public void handleLoginButtonAction(ActionEvent actionEvent) {

        String username = usernameInput.getText();
        String password = passwordInput.getText();

        if (
                username.equals("") ||
                password.equals("") ||
                username.length() > MAX_STRING_INPUT_LENGTH ||
                password.length() > MAX_STRING_INPUT_LENGTH)
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Login error");
            if (password.equals("")) {
                alert.setContentText(alert.getContentText() + "Password cannot be null.\n");
                passwordInput.requestFocus();
                passwordInput.selectAll();
            }
            if (password.length() > MAX_STRING_INPUT_LENGTH) {
                alert.setContentText(alert.getContentText() + "Password cannot be longer than 50 characters.\n");
                passwordInput.requestFocus();
                passwordInput.selectAll();
            }
            if (username.equals("")) {
                alert.setContentText(alert.getContentText() + "Username cannot be null.\n");
                usernameInput.requestFocus();
                usernameInput.selectAll();
            }
            if (username.length() > MAX_STRING_INPUT_LENGTH) {
                alert.setContentText(alert.getContentText() + "Username cannot be longer than 50 characters.\n");
                usernameInput.requestFocus();
                usernameInput.selectAll();
            }

            alert.showAndWait();


            return;
        }

        // Check if username exists in database
        try {
            statement = dbm.getConnection().createStatement();
            String queryString = "SELECT * FROM " + username;
            resultSet = statement.executeQuery(queryString);
            String storedPassword = null;
            if (resultSet.next()) storedPassword = resultSet.getString("password");
            storedPassword = encryptor.getEncryptionTool().decrypt(storedPassword);
            if (password.equals(storedPassword)) {
                showAccountScreen(username);
            } else {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Incorrect Password");
                alert.setContentText("Please reenter your password and try again.");
                alert.showAndWait();
                passwordInput.requestFocus();
                passwordInput.selectAll();
            }
        }

        // If username doesn't exist, flow of control defaults to catch
        // Confirm new account creation with popup menu
        catch (Exception e) {
            TextInputDialog confirmPasswordDialog = new TextInputDialog();
            confirmPasswordDialog.setTitle("Create New Account");
            confirmPasswordDialog.setHeaderText(
                    "Account with entered username/password was not found.\n" +
                    "Confirm password to create new account, or exit to try again.");
            confirmPasswordDialog.setContentText("Confirm password:");
            Optional<String> confirmPasswordResult = confirmPasswordDialog.showAndWait();
            String confirmationPassword = null;
            if (confirmPasswordResult.isPresent()) {
                confirmationPassword = confirmPasswordResult.get();

                if (password.equals(confirmationPassword)) {
                    try {
                        String encryptedPassword = encryptor.getEncryptionTool().encrypt(password);
                        String tableCreate = "CREATE TABLE " + username + " (PASSWORD varchar(50), NAME varchar(100), PW varchar(100))";
                        String passwordCreate = "INSERT INTO " + username + " (password) VALUES ('" + encryptedPassword + "')";
                        statement.executeUpdate(tableCreate);
                        statement.executeUpdate(passwordCreate);
                        showAccountScreen(username);
                    } catch (Exception g) {
                        g.printStackTrace();
                        System.exit(1);
                    }
                } else {
                    Alert alert = new Alert(Alert.AlertType.ERROR);
                    alert.setTitle("Password mismatch");
                    alert.setContentText("Passwords do not match.");
                    alert.showAndWait();
                    passwordInput.requestFocus();
                    passwordInput.selectAll();
                }
            }
        }
    }

    private void showAccountScreen(String username) {
        Stage currentStage = (Stage) root.getScene().getWindow();
        currentStage.hide();
        usernameInput.clear();
        passwordInput.clear();

        SessionManager sessionManager = SessionManager.getInstance();
        sessionManager.setUsername(username);
        sessionManager.setLastStage(currentStage);

        pdsStart main2 = new pdsStart();
        try {
            main2.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleKeyPressed(KeyEvent keyEvent) {
        if (keyEvent.getCode() == KeyCode.ENTER) {
            handleLoginButtonAction(new ActionEvent());
        }
    }
}
