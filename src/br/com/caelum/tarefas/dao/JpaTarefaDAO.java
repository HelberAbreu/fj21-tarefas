package br.com.caelum.tarefas.dao;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.caelum.tarefas.modelo.Tarefa;

@Repository
public class JpaTarefaDAO implements TarefaDao {

	@PersistenceContext
	EntityManager entityManager;



	
	public void adiciona(Tarefa tarefa){
		entityManager.persist(tarefa);
	}

	public void remove(Tarefa tarefa) {
		entityManager.remove(tarefa);
	}

	public void altera(Tarefa tarefa) {
		entityManager.merge(tarefa);
	}

	public List<Tarefa> lista() {
		return entityManager.createQuery("select t from Tarefa t").getResultList();	
	}

	public Tarefa buscaPorId(Long id) {
		return entityManager.find(Tarefa.class, id);	
	}

	public void finaliza(Long id) {
		 Tarefa tarefa = buscaPorId(id);
		 
		 tarefa.setDataFinalizacao(Calendar.getInstance());
		 tarefa.setFinalizado(true);
		 
		 entityManager.merge(tarefa);
	}

}
