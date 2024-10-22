package br.com.appgerenciador.agendamentos.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.appgerenciador.agendamentos.modelo.AgendamentoModell;

public interface AgendamentoRepository extends CrudRepository<AgendamentoModell, Long> {

}
