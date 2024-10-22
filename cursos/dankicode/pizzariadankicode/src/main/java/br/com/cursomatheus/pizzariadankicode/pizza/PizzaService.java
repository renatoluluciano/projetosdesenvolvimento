package br.com.cursomatheus.pizzariadankicode.pizza;



import org.modelmapper.ModelMapper;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.persistence.EntityNotFoundException;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PizzaService {
	
	private final PizzaRepository pizzaRepository;
	
	private final ModelMapper modelMapper;
	
	
	public PizzaDTO criarPizza(PizzaDTO dto) {
		Pizza pizza = modelMapper.map(dto, Pizza.class);
		
		pizzaRepository.save(pizza);
		
		return modelMapper.map(pizza, PizzaDTO.class);		
		
	}


	public Page<PizzaDTO> buscarTodos(Pageable paginacao) {
		
		return pizzaRepository.findAll(paginacao).map(p -> modelMapper.map(p, PizzaDTO.class));
	}


	public PizzaDTO buscarPorID(Long id) {
		Pizza pizza = pizzaRepository.findById(id).orElseThrow(() -> new EntityNotFoundException());
		return modelMapper.map(pizza, PizzaDTO.class);
	}


	public PizzaDTO atualizarPorID(Long id, PizzaDTO dto) {
		Pizza pizza = modelMapper.map(dto, Pizza.class);
		pizza.setId(id);
		pizza = pizzaRepository.save(pizza);
		
		return modelMapper.map(pizza, PizzaDTO.class);
		
	}


	public void excluir(@NotNull Long id) {
		pizzaRepository.deleteById(id);
		
	}
	
	
	
	
	
		
		
		
	}
	
	
	
		
	


