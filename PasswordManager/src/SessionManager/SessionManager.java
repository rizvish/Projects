package SessionManager;

import javafx.stage.Stage;

/**
 * Created by Kyle on 4/15/2017.
 */

public class SessionManager {
    private static SessionManager sessionManager;

    private String username;
    private Stage lastStage;

    private SessionManager() {}

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Stage getLastStage() {
        return lastStage;
    }

    public void setLastStage(Stage lastStage) {
        this.lastStage = lastStage;
    }

    public static SessionManager getInstance() {
        if (sessionManager == null) {
            sessionManager = new SessionManager();
        }
        return sessionManager;
    }

}
