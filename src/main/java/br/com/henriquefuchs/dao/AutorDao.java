package br.com.henriquefuchs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.henriquefuchs.factory.ConnectionFactory;
import br.com.henriquefuchs.modelo.Autor;

public class AutorDao {
	private Connection conexao;

	public AutorDao() {
		this.conexao = new ConnectionFactory().getConnection();
	}

	public void cadastrar(Autor autor) {
		try {
			String sql = "insert into autores(nome, email, datanascimento, minicurriculo) values(?, ?, ?, ?)";

			PreparedStatement preparedStatement = conexao.prepareStatement(sql);
			preparedStatement.setString(1, autor.getNome());
			preparedStatement.setString(2, autor.getEmail());
			preparedStatement.setDate(3, Date.valueOf(autor.getDataNascimento()));
			preparedStatement.setString(4, autor.getMiniCurriculo());

			preparedStatement.execute();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Autor> listar() {
		try {
			String sql = "select * from autores";

			PreparedStatement preparedStatement = conexao.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();

			List<Autor> autores = new ArrayList<Autor>();
			while (resultSet.next()) {
				Autor autor = new Autor();
				autor.setNome(resultSet.getString("nome"));
				autor.setEmail(resultSet.getString("email"));
				autor.setDataNascimento(resultSet.getDate("dataNascimento").toLocalDate());
				autores.add(autor);
			}

			return autores;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
