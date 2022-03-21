function calc(){
    let elemProduto = document.getElementById("produto");
    let elemValor = document.getElementById("valor");
    let elemQtd = document.getElementById("quantidade");
    let preco = elemProduto.options[elemProduto.selectedIndex].textContent;
    let valor = preco.substring(preco.indexOf('$')+1);
    quantidade = elemQtd.value;
    valor = (valor.replace(',','.')*quantidade).toFixed(2);
    valor = valor.replace('.',',');
    elemValor.value = valor;
    
}

