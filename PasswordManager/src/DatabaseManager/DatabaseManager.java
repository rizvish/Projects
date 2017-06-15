package DatabaseManager;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by Kyle on 4/15/2017.
 */

public class DatabaseManager {
    private static DatabaseManager databaseManager;

    private Connection connection;

    private DatabaseManager() {}

    public static DatabaseManager getInstance() {
        if (databaseManager == null) {
            databaseManager = new DatabaseManager();
            databaseManager.createConnection();
        }
        return databaseManager;
    }

    private final String h2Folder = "jdbc:h2:~/Qupu5Yps1TnlRhd3";
    private final String h2Username = "ASrC8eDQJvqeTVYA";
    private final String h2Password = "arFnXEzx0bm4bqUj";

    private void createConnection() {
        try {
            this.connection = DriverManager.getConnection(h2Folder, h2Username, h2Password);
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    public Connection getConnection() {
        return this.connection;
    }
}
