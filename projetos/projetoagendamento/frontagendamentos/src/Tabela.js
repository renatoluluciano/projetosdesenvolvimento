function Tabela({vetor, selecionar}){
    return(
        <table className="table">
            <thead>
                <tr>
                    <th>Nome de Guerra</th>
                    <th>Data Inicio</th>
                    <th>Data Final</th>
                    <th>Afastamento</th> 
                    <th>Ações</th>        
                </tr>
            </thead>

            <tbody>
               {
                vetor.map((objeto, indice)=>(
                    <tr key = {indice}>
                    <td>{objeto.nomePolicial}</td>
                    <td>{objeto.dataInicio}</td>
                    <td>{objeto.dataFinal}</td>
                    <td>{objeto.tipoAfastamento}</td>
                    <td><button onClick={()=>selecionar(indice)} className="btn btn-success">Selecionar</button></td>
                </tr>
                ))
               }
               
               
               
               
               
            </tbody>

        </table>
    )
}


export default Tabela;