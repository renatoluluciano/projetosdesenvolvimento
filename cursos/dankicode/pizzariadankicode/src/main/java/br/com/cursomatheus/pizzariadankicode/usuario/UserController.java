package br.com.cursomatheus.pizzariadankicode.usuario;

import java.net.URI;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;


@RestController
@RequestMapping("/usuario")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping
    public ResponseEntity<DadosUsuarioCadastro> cadastrarUsuario(@RequestBody @Valid DadosUsuarioCadastro dadosCadastro, 
    UriComponentsBuilder uriComponentsBuilder){

        DadosUsuarioCadastro cadastroUsuario = userService.criarUsuario(dadosCadastro);

        URI endereco = uriComponentsBuilder.path("/usuario/{id}").buildAndExpand(cadastroUsuario.getId()).toUri();

        return ResponseEntity.created(endereco).body(cadastroUsuario);

    }
}
    


