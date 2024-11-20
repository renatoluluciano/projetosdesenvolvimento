const puppeteer = require('puppeteer');



(async () => {
    const browser = await puppeteer.launch({
        headless: false,
    });

    const page = await browser.newPage()

    await page.goto('https://voluntario.seape.df.gov.br/');
    await page.setViewport({width: 1080, height: 1024});

    //input de codigo da vaga

   

    //primeira opcao de voluntario
    const codigoVoluntario01 = "779163779";
    const dataVoluntario01 = 'xpath=//*[@id="frmPrincipal:horaInicio_inline"]/div/table/tbody/tr[5]/td[4]/a';

    //segundaa opcao de voluntario
    const codigoVoluntario02 = '779163781';
    const dataVoluntario02 = 'xpath=//*[@id="frmPrincipal:horaInicio_inline"]/div/table/tbody/tr[5]/td[6]/a';

    // terceira opçao
    const codigoVoluntario03 = "779162627";
    const dataVoluntario03 = 'xpath=//*[@id="frmPrincipal:horaInicio_inline"]/div/table/tbody/tr[4]/td[7]/a';

    //click em um item da pagina


    await fazerLogin();

    

    await pesquisaVaga(codigoVoluntario01, dataVoluntario01);
    await esperar(3000);
    await pesquisaVaga(codigoVoluntario02, dataVoluntario02); 
    await esperar(3000);
    await pesquisaVaga(codigoVoluntario03, dataVoluntario03);
    await esperar(3000);
    await page.goto('https://voluntario.seape.df.gov.br/paginas/voluntario/meus_voluntarios.xhtml'); 

   
    
    

    async function fazerLogin() {
        await page.type('xpath=//*[@id="username"]', '');
    
        await page.type('xpath=//*[@id="password"]', '');
    
        await page.click('xpath=//*[@id="btnEmitir"]/span[2]');
    
    }
    
    async function mudarMes() {
        try {
            //await page.waitForSelector('xpath=//*[@id="frmPrincipal:horaInicio_inline"]/div/div/a[2]/span', {visible: true, timeout: 30000});
            await page.click('xpath=//*[@id="frmPrincipal:horaInicio_inline"]/div/div/a[2]/span');
        } catch (error) {
            console.log('Não há mes para passar');
        }        

    }

    

    async function pesquisaVaga(codigoVaga, dataVoluntario){

        await mudarMes();

        
        
        await page.waitForSelector('xpath=//*[@id="frmPrincipal:input"]', {visible: true, timeout: 10000});
        
        const campoCodigo = await page.$('xpath=//*[@id="frmPrincipal:input"]');
        //apaga codigo da vaga
        await campoCodigo.click({clickCount: 3});
        await campoCodigo.press('Backspace');
        //insere codigo da vaga 
        await campoCodigo.type(codigoVaga);
        //insere codigo da vaga
       
        
        //seleciona dia no calendario
        await page.click(dataVoluntario);
        //botão pesquisar
        await page.click('xpath=//*[@id="frmPrincipal:btn"]/span[2]');
        //botão agendar
        try {
            await page.waitForSelector('xpath=//*[@id="frmPrincipal:tabelaVagas:0:j_idt62"]/span[2]', {visible: true, timeout: 3000});
            await page.click('xpath=//*[@id="frmPrincipal:tabelaVagas:0:j_idt62"]/span[2]');
            //confirmar marcacao
            await page.waitForSelector('xpath=//*[@id="frmPrincipal:j_idt66"]/span[2]', {visible: true, timeout: 5000});
            await page.click('xpath=//*[@id="frmPrincipal:j_idt66"]/span[2]');
            await esperar(2000);
            await page.goto('https://voluntario.seape.df.gov.br/paginas/voluntario/inscricao.xhtml');
            
        } catch (error) {
            console.log('Voluntario não marcado.');
            await page.goto('https://voluntario.seape.df.gov.br/paginas/voluntario/inscricao.xhtml');             
        }
        
        
        
        
        
       

        
    }

    function esperar(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
      }
          
        
                
        

        
        
    

   



})();



