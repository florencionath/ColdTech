//  type="text/javascript"
// 		$("#cep").focusout(function(){
// 			//Início do Comando AJAX
// 			$.ajax({
// 				//O campo URL diz o caminho de onde virá os dados
// 				//É importante concatenar o valor digitado no CEP
// 				url: 'https://viacep.com.br/ws/'+$(this).val()+'/json/unicode/',
// 				//Aqui você deve preencher o tipo de dados que será lido,
// 				//no caso, estamos lendo JSON.
// 				dataType: 'json',
// 				//SUCESS é referente a função que será executada caso
// 				//ele consiga ler a fonte de dados com sucesso.
// 				//O parâmetro dentro da função se refere ao nome da variável
// 				//que você vai dar para ler esse objeto.
// 				success: function(resposta){
// 					//Agora basta definir os valores que você deseja preencher
// 					//automaticamente nos campos acima.
// 					$("#logradouro").val(resposta.logradouro);
// 					$("#complemento").val(resposta.complemento);
// 					$("#bairro").val(resposta.bairro);
// 					$("#cidade").val(resposta.localidade);
// 					$("#uf").val(resposta.uf);
// 					//Vamos incluir para que o Número seja focado automaticamente
// 					//melhorando a experiência do usuário
// 					$("#numero").focus();
// 				}
// 			});
// 		});
	



 
function limpa_formulário_cep() {
	//Limpa valores do formulário de cep.
	document.getElementById('rua').value=("");
	document.getElementById('bairro').value=("");
	document.getElementById('cidade').value=("");
	document.getElementById('uf').value=("");
	
}

function meu_callback(conteudo) {
if (!("erro" in conteudo)) {
	//Atualiza os campos com os valores.
	document.getElementById('rua').value=(conteudo.logradouro);
	document.getElementById('bairro').value=(conteudo.bairro);
	document.getElementById('cidade').value=(conteudo.localidade);
	document.getElementById('uf').value=(conteudo.uf);

} //end if.
else {
	//CEP não Encontrado.
	limpa_formulário_cep();
	alert("CEP não encontrado.");
}
}

function pesquisacep(valor) {

//Nova variável "cep" somente com dígitos.
var cep = valor.replace(/\D/g, '');

//Verifica se campo cep possui valor informado.
if (cep != "") {

	//Expressão regular para validar o CEP.
	var validacep = /^[0-9]{8}$/;

	//Valida o formato do CEP.
	if(validacep.test(cep)) {

		//Preenche os campos com "..." enquanto consulta webservice.
		document.getElementById('rua').value="...";
		document.getElementById('bairro').value="...";
		document.getElementById('cidade').value="...";
		document.getElementById('uf').value="...";

		//Cria um elemento javascript.
		var script = document.createElement('script');

		//Sincroniza com o callback.
		script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

		//Insere script no documento e carrega o conteúdo.
		document.body.appendChild(script);

	} //end if.
	else {
		//cep é inválido.
		limpa_formulário_cep();
		alert("Formato de CEP inválido.");
	}
} //end if.
else {
	//cep sem valor, limpa formulário.
	limpa_formulário_cep();
}
};