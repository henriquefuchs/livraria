package br.com.henriquefuchs.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/livraria";
			String usuario = "root";
			String senha = "123";

			Class.forName("com.mysql.cj.jdbc.Driver");

			return DriverManager.getConnection(url, usuario, senha);

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
