package br.com.appgerenciador.agendamentos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import br.com.appgerenciador.agendamentos.modelo.AgendamentoModell;
import br.com.appgerenciador.agendamentos.modelo.RespostaModelo;
import br.com.appgerenciador.agendamentos.repository.AgendamentoRepository;

@Service
public class AgendamentoServico {

    @Autowired
    private AgendamentoRepository agendamentoRepository;

    @Autowired
    private RespostaModelo respostaModelo;


    public Iterable<AgendamentoModell> listarAgendamentos(){

        return agendamentoRepository.findAll();
    }

    public ResponseEntity<RespostaModelo> excluirAgendamento(Long idAgendamento){

        agendamentoRepository.deleteById(idAgendamento);
        respostaModelo.excluirSucesso();
        return new ResponseEntity<>(respostaModelo, HttpStatus.OK);
    }

    
    public ResponseEntity<?> cadastrarAlterarAgendamento(AgendamentoModell agendamentoModell, String action){
    if(agendamentoModell.getNomePolicial().equals("")){
        
        respostaModelo.nomeVazio();
        return new ResponseEntity<>(respostaModelo, HttpStatus.BAD_REQUEST);
    }else if(agendamentoModell.getDataInicio().equals("")){
        respostaModelo.dataInicioVazio();
        return new ResponseEntity<>(respostaModelo, HttpStatus.BAD_REQUEST);
    }else if(agendamentoModell.getDataFinal().equals("")){
        respostaModelo.dataFinalVazio();
        return new ResponseEntity<>(respostaModelo, HttpStatus.BAD_REQUEST);
     }else if(agendamentoModell.getTipoAfastamento().equals("")){
        respostaModelo.tipoAfastamentoVazio();
        return new ResponseEntity<>(respostaModelo, HttpStatus.BAD_REQUEST);
     }else{
        if (action.equals("cadastrar")) {
            return new ResponseEntity<>(agendamentoRepository.save(agendamentoModell), HttpStatus.CREATED);
        }else{
            return new ResponseEntity<>(agendamentoRepository.save(agendamentoModell), HttpStatus.OK);
        }
    }
        
     }
    }

