package br.com.cursomatheus.pizzariadankicode.pizza;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository													
public interface PizzaRepository extends JpaRepository<Pizza, Long> {
	
	

}
