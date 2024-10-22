package br.com.appgerenciador.agendamentos.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.appgerenciador.agendamentos.modelo.AgendamentoModell;
import br.com.appgerenciador.agendamentos.modelo.RespostaModelo;
import br.com.appgerenciador.agendamentos.service.AgendamentoServico;



@RestController
@CrossOrigin(origins = "*")
public class AgendamentoController {

    @Autowired
    private AgendamentoServico agendamentoServico;

    @PutMapping("/alterar")
    public ResponseEntity<?>alterar(@RequestBody AgendamentoModell agendamentoModell) {       
        
        return agendamentoServico.cadastrarAlterarAgendamento(agendamentoModell, "alterar");
    }    

    @PostMapping("/cadastrar")
    public ResponseEntity<?>cadastrar(@RequestBody AgendamentoModell agendamentoModell) {        
        
        return agendamentoServico.cadastrarAlterarAgendamento(agendamentoModell, "cadastrar");
    }

    @GetMapping("/listar")
    public Iterable<AgendamentoModell> listar(){

        return agendamentoServico.listarAgendamentos();

    }
    
    @DeleteMapping("deletar/{idAgendamento}")
    public ResponseEntity<RespostaModelo> excluirAgendamento(@PathVariable Long idAgendamento){

        return agendamentoServico.excluirAgendamento(idAgendamento);

    }

    @GetMapping("/")
    public String rota(){
        return "Funcionando";
    }

}