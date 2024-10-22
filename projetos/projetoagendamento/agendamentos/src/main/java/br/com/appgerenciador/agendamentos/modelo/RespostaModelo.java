package br.com.appgerenciador.agendamentos.modelo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;


@Component
@Getter
@Setter
public class RespostaModelo {

    private String mensagem;

    public String nomeVazio(){
        mensagem = "O campo nome tem que ser preeenchido";
        return mensagem;
    }

    public String dataInicioVazio() {
        mensagem = "O campo data inicial precisa ser preeenchido";
        return mensagem;
    }

    public String dataFinalVazio() {
        mensagem = "O campo data final precisa ser preeenchido";
        return mensagem;
    }

    public String tipoAfastamentoVazio() {
        mensagem = "O campo data final precisa ser preeenchido";
        return mensagem;
    }

    public String excluirSucesso() {
        mensagem = "Agendamento removido";
        return mensagem;
    }

    
    

}
