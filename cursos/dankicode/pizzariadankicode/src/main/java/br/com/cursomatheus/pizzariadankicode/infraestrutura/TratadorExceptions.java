package br.com.cursomatheus.pizzariadankicode.infraestrutura;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import jakarta.persistence.EntityNotFoundException;

@RestControllerAdvice
public class TratadorExceptions {

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity tratarException404(){

        return ResponseEntity.notFound().build();

    }

}
