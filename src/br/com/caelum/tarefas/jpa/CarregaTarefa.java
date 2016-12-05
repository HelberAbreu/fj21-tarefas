package br.com.caelum.tarefas.jpa;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.caelum.tarefas.modelo.Tarefa;

public class CarregaTarefa {
	
	public static void main(String[] args) {

		remover();
	}

	
	public static void select(){
		Tarefa tarefa = new Tarefa();

		EntityManagerFactory factoy = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factoy.createEntityManager();
		
		tarefa = manager.find(Tarefa.class, 1L);
		
		System.out.println(tarefa);
		
		manager.close();
	}
	
	public static void remover(){

		EntityManagerFactory factoy = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factoy.createEntityManager();
		
		Tarefa tarefa = manager.find(Tarefa.class, 1L);
		manager.getTransaction().begin();
		
		manager.remove(tarefa);
		
		manager.getTransaction().commit();
		System.out.println("Sucesso");
		
		manager.close();
	}
	
	public static void alterar(){

		EntityManagerFactory factoy = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factoy.createEntityManager();
		
		Tarefa tarefa = manager.find(Tarefa.class, 1L);
		manager.getTransaction().begin();
		
		manager.remove(tarefa);
		
		manager.getTransaction().commit();
		System.out.println("Sucesso");
		
		manager.close();
	}
}
