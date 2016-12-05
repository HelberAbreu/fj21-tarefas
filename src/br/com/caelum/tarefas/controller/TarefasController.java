package br.com.caelum.tarefas.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.JdbcTarefaDao;
import br.com.caelum.tarefas.dao.TarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Transactional
@Controller
public class TarefasController {
	
	@Autowired
	private final TarefaDao dao;

	@Autowired
	public TarefasController(TarefaDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/novaTarefa")
	public String form() {
		return "tarefa/formulario";
	}

	@RequestMapping("/adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {

		if (result.hasFieldErrors("descricao")) {
			return "tarefa/formulario";
		}

		dao.adiciona(tarefa);
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("/listaTarefas")
	public String lista(Model model) {
		
		model.addAttribute("tarefas", dao.lista());
		return "tarefa/lista";
	}
	
	@RequestMapping("/removeTarefa")
	public void remove(Tarefa tarefa, HttpServletResponse response) {
		
		dao.remove(tarefa);
		response.setStatus(200);
	}
	
	@RequestMapping("/mostraTarefa")
	public String mostra(Long id, Model model) {
		
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/mostra";
	}
	
	@RequestMapping("/alteraTarefa")
	public String altera(Tarefa tarefa) {
		
		dao.altera(tarefa);
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("/finalizaTarefa")
	public void finaliza(Long id, HttpServletResponse response) throws IOException {
		
		dao.finaliza(id);
		
		Date dataDeFinalizacao = dao.buscaPorId(id).getDataFinalizacao().getTime();
		String data = new SimpleDateFormat("dd/MM/yyyy").format(dataDeFinalizacao);
		response.getWriter().write(data);
		response.setStatus(200);
	}
}
