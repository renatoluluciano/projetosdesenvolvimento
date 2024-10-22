package br.com.cursomatheus.pizzariadankicode.usuario;

import org.modelmapper.ModelMapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.cursomatheus.pizzariadankicode.config.CriptografiaSenha;
import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {

    
    private final UserRepository userRepository;

    private final ModelMapper modelMapper;



    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
            
        return userRepository.findByLogin(login);
    
    }

    public DadosUsuarioCadastro criarUsuario(DadosUsuarioCadastro usuarioDTO) {

        Usuario usuario = modelMapper.map(usuarioDTO, Usuario.class);
        
        //criptografando a senha
        String senhaCriptografada = CriptografiaSenha.criptografia(usuario.getPassword());
        usuario.setPassword(senhaCriptografada);

        userRepository.save(usuario);

        return modelMapper.map(usuario, DadosUsuarioCadastro.class);



    }



}
