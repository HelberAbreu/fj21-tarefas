package br.com.caelum.tarefas.dao;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.tarefas.modelo.Tarefa;

public interface TarefaDao {

	public void adiciona(Tarefa tarefa);
	public void remove(Tarefa tarefa);
	public void altera(Tarefa tarefa);
	public List<Tarefa> lista();
	public Tarefa buscaPorId(Long id);
	public void finaliza(Long id);

}
