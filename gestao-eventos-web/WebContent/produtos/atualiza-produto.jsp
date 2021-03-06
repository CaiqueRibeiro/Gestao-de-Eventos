<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="../css/visual.css"/>

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Atualização de Produto</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:import url="../header.jsp" />
	
	<div class="container-fluid" style="justify-content: flex-end;">
		<div class="container-form">
			
			<form action="alterar">
			<input type="hidden" name="pdt-id" value="${resultado.getId()}">
			  <div class="form-row">
			    <div class="form-group col-md-6">
			    	<label for="nome">Nome</label>
			    	<input type="text" required class="form-control" name="nome" id="nome" value="${resultado.getNome()}">
			    </div>
			    <div class="form-group col-md-3">
			      <label for="perecivel">Perecivel</label>
					<select class="perecivel form-control" id="perecivel" name="perecivel">
						<option ${resultado.isPerecivel() == true ? "selected" : "" } value="true">SIM</option>
						<option ${resultado.isPerecivel() == false ? "selected" : "" } value="false">NÃO</option>
					</select>
			    </div>
			    <div class="form-group col-md-3">
			      <label for="categoria">Categoria</label>
					<select class="categoria form-control" id="categoria" name="categoria">
						<option value="1" ${resultado.getCategoria().getId() == 1 ? "selected" : "" }>Bebida Alcóolica</option>
						<option value="2" ${resultado.getCategoria().getId() == 2 ? "selected" : "" }>Roupas e Acessórios</option>
						<option value="3" ${resultado.getCategoria().getId() == 3 ? "selected" : "" }>Doces e Salgadinhos</option>
						<option value="4" ${resultado.getCategoria().getId() == 4 ? "selected" : "" }>Equipamentos</option>
						<option value="5" ${resultado.getCategoria().getId() == 5 ? "selected" : "" }>Bebida sem álcool</option>
						<option value="6" ${resultado.getCategoria().getId() == 6 ? "selected" : "" }>Material de construcao</option>
						<option value="7" ${resultado.getCategoria().getId() == 7 ? "selected" : "" }>Material de estudo</option>
					</select>
			    </div>
			  </div>
			  <div class="form-row">
				  <div class="form-group col-md-12">
				    <label for="descricao">Descrição</label>
				    <textarea name="descricao" id="descricao" class="form-control" required>${resultado.getDescricao()}</textarea>
				  </div>
			  </div>
			  <br/>
			  <button type="submit" required name="operacao" class="btn btn-primary" value="ATUALIZAR">ATUALIZAR</button>
			  <a href="excluir?&operacao=EXCLUIR&pdt-id=${resultado.getId()}" class="btn btn-danger">EXCLUIR</a>
			</form>
		</div>
	</div>
	
	<script src="../bootstrap/js/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="../bootstrap/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="../js/visual.js"></script>
</body>
</html>