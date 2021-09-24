package br.com.henriquefuchs.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.henriquefuchs.dao.AutorDao;
import br.com.henriquefuchs.modelo.Autor;

@WebServlet("/autores")
public class AutoresServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		LocalDate dataNascimento = LocalDate.parse(request.getParameter("dataNascimento"));
		String miniCurriculo = request.getParameter("miniCurriculo");

		AutorDao autorDao = new AutorDao();
		autorDao.cadastrar(new Autor(nome, email, dataNascimento, miniCurriculo));

		response.sendRedirect("autores");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("autores", new AutorDao().listar());
		request.getRequestDispatcher("WEB-INF/jsp/autores.jsp").forward(request, response);
	}

}
