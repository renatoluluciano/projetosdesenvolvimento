package br.com.cursomatheus.pizzariadankicode.config;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;

import br.com.cursomatheus.pizzariadankicode.usuario.Usuario;

@Service
public class TokenService {

    public String criarToken(Usuario usuario){
        try{
            
            Algorithm algoritimo = Algorithm.HMAC256("12345");

            LocalDateTime tempoExpiracao = LocalDateTime.now().plusMinutes(5);

            return JWT.create()
            .withSubject(usuario.getLogin())
            .withExpiresAt(tempoExpiracao.toInstant(ZoneOffset.of("-03:00")))
            .withIssuer("Piazzaria Danki Code")
            .sign(algoritimo);

    }catch(JWTCreationException e){

        throw new RuntimeException("Errro ao Criar Token", e);
    }
        
    }

    public String validarTokem(String token){
        try {
            Algorithm algoritimo = Algorithm.HMAC256("12345");

            return JWT.require(algoritimo)
            .withIssuer("Piazzaria Danki Code")
            .build()
            .verify(token)
            .getSubject();
            
        } catch (JWTVerificationException e) {
            throw new RuntimeException("Token Incorreto.");
            // TODO: handle exception
        }

    }

}
