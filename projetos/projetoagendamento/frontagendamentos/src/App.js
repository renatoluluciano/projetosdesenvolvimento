import { useEffect, useState } from 'react';
import './App.css';
import Formulario from './Formulario';
import Tabela from './Tabela';

function App() {

  //objeto produto
  const dataFinal = new Date;

  const agendamento = {

    idAgendamento : 0,
    nomePolicial : '',
    dataInicio : '',
    dataFinal : '',
    tipoAfastamento : ''

  }

  //useState
  const [btnCadastrar, setBtnCadastrar] = useState(true);
  const [agendamentos, setAgendamentos] = useState([]); 
  const [objAgendamento, setObjAgendamento] = useState(agendamento); //vetor de agendamentos
  

  //useEffect
  useEffect(()=>{
    fetch("http://localhost:8080/listar")
    .then(retorno => retorno.json())
    .then(retorno_convertido => setAgendamentos(retorno_convertido))
  }, []);

  //obtendo os dados do formulario

  const enquantoDigita = (e) => {
    setObjAgendamento({...objAgendamento, [e.target.name]:e.target.value })
  }

  //Cadastrar Agendamento

  const cadastrarAgendamento = () => {
    fetch("http://localhost:8080/cadastrar", {
      method:'post',
      body:JSON.nullify(objAgendamento),
      headers:{
        'Content-type':'application/json',
        'Accept':'application/json'
      }
    }).then(retorno => retorno.json())
    .then(retorno_convertido => {

      if(retorno_convertido.mensagem !== undefined){
        alert(retorno_convertido.mensagem);
      }else{

        setAgendamentos([...agendamentos, retorno_convertido]);
        alert("Agendamento realizado com sucesso.");
        
      }

    })
  }

  // Limpar Fomulario
  const limparFormulario = () =>{
    
    setObjAgendamento(agendamento);
  }

  //selecionar iten

  const selecionarProduto = (indice)=>{
      setObjAgendamento(agendamentos[indice]);
      setBtnCadastrar(false);
  }

  //Retorno
  return (
    <div>
      <p>
        {JSON.stringify(objAgendamento)}
      </p>
      <Formulario botao = {btnCadastrar} eventoTeclado={enquantoDigita} cadastrarAgendamento={cadastrarAgendamento} objeto={agendamento}/>
      <Tabela vetor = {agendamentos} selecionar={selecionarProduto}/> 
      
    </div>
  );
}

export default App;
