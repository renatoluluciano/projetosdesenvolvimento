package br.com.cursomatheus.pizzariadankicode.pizza;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//informando ao spring boor que essa classe é uma Entidade, que será uma tabela e que terá um id - chave primária
@Entity 
@Table(name = "Pizza")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Pizza {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private boolean disponivel;
	private double preco;	
	@Enumerated(EnumType.STRING)
	private Sabor sabor;	
	@Enumerated(EnumType.STRING)
	private Tamanho tamanho;
	@Enumerated(EnumType.STRING)
	private Categoria categoria;
	
}