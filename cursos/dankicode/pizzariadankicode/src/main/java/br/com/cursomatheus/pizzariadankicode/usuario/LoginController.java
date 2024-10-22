package br.com.cursomatheus.pizzariadankicode.usuario;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;



@RestController
@RequestMapping("login")
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;

    private final AuthenticationManager autenticador;
     
    //method Post pois vai receber informaçoes
    @PostMapping
    public ResponseEntity<Void> validacaoCredenciaisUsuario(@RequestBody @Valid CredenciaisUsuarioDTO credenciais){

        UsernamePasswordAuthenticationToken token = 
        new UsernamePasswordAuthenticationToken(credenciais.getLogin(), credenciais.getPassword());

        Authentication autenticacao = autenticador.authenticate(token);

        return ResponseEntity.ok().build();

    }

}
