package br.com.appgerenciador.agendamentos.modelo;




import java.util.Calendar;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "agendamentos")
@Getter
@Setter
public class AgendamentoModell {

    @Id 
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private Long agendamentoId;
    private String nomePolicial;
    @JsonFormat(pattern="dd-MM-yyyy")   
    private Calendar dataInicio;
    @JsonFormat(pattern="dd-MM-yyyy")   
    private Calendar dataFinal;
    @Enumerated(EnumType.STRING)
    private CategoriaAfastamento tipoAfastamento;    

    
    
}
