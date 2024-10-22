function Formulario({botao, eventoTeclado, cadastrarAgendamento, objeto}){
    return(
        
        <form>
            
            <input type="text" onChange={eventoTeclado}  name='nomePolicial' placeholder="Nome de Guerra" className="form-control" />
            <input type="date" onChange={eventoTeclado}  name='dataInicio' placeholder="DataInicial" className="form-control"/>
            <input type="date" onChange={eventoTeclado}  name='dataFinal' placeholder="DataFinal" className="form-control"/>
            <select placeholder="Tipo de Afastamento" onChange={eventoTeclado}  name='tipoAfastamento' className="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
            <option selected >TIPO DE AFASTAMENTO</option>
  	            <option value="FERIAS">FERIAS</option>
  	            <option value="FOLGABH">FOLGA COMPENSATORIA</option>
  	            <option value="ABONO">ABONO</option>
  	            <option value="LICENCA_PREMIO">LICENSA PREMIO</option>
            </select>
            {
                botao
                ?
                    <input type="button" value="Cadastar" className="btn btn-primary" onClick={cadastrarAgendamento}/>
                :
                <div>
                    <input type="button" value="Excluir" className="btn btn-danger"/>
                    <input type="button" value="Alterar" className="btn btn-warning"/>
                    <input type="button" value="Cancelar" className="btn btn-secondary"/>
                </div>
            }   
           
        </form>
    )
}

export default Formulario;