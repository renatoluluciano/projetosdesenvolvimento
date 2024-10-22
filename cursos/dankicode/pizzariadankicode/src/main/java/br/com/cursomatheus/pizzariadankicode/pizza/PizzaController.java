package br.com.cursomatheus.pizzariadankicode.pizza;





import org.springframework.data.domain.Pageable;

import java.net.ResponseCache;
import java.net.URI;

import org.springframework.data.domain.Page;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;


@RestController
@RequestMapping("/pizzas")
@AllArgsConstructor
public class PizzaController {
	
	private final PizzaService pizzaService;
	
	@PostMapping
	public ResponseEntity<PizzaDTO> cadastrar(@RequestBody @Valid PizzaDTO dto, UriComponentsBuilder uriBuilder) {
		
		PizzaDTO pizzaDTO = pizzaService.criarPizza(dto);
		URI endereco = uriBuilder.path("/pizzas/{id}").buildAndExpand(pizzaDTO.getId()).toUri();
		
		return ResponseEntity.created(endereco).body(pizzaDTO);
		
	}
	
	@GetMapping
	public ResponseEntity<Page<PizzaDTO>> bucarTodos(@PageableDefault(size = 10)Pageable paginacao){
		
		Page<PizzaDTO> pagePizzaDTO = pizzaService.buscarTodos(paginacao);
		
		return ResponseEntity.ok(pagePizzaDTO);
		
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<PizzaDTO> bucarPorID(@PathVariable @NotNull Long id){
		
		PizzaDTO pizzaDTO = pizzaService.buscarPorID(id);
		
		return ResponseEntity.ok(pizzaDTO);
		
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<PizzaDTO> atualizarPorID(@PathVariable @NotNull Long id, @RequestBody @Valid PizzaDTO dto ){
		PizzaDTO pizzaAtualizada = pizzaService.atualizarPorID(id, dto);
		return ResponseEntity.ok(pizzaAtualizada);
		
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<PizzaDTO> excluir(@PathVariable @NotNull Long id) {
		pizzaService.excluir(id);
		
		return ResponseEntity.noContent().build();
		
	}
	
	
	
	

}
