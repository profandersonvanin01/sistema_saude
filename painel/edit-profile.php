<?php
    session_start();
    if(
        (!isset($_SESSION['id_usuario']) == true) and
        (!isset($_SESSION['nome_usuario']) == true) and
        (!isset($_SESSION['email_usuario']) == true) and
        (!isset($_SESSION['tipo_usuario']) == true)
    ){
        unset($_SESSION['id_usuario']);
        unset($_SESSION['nome_usuario']);
        unset($_SESSION['email_usuario']);
        unset($_SESSION['tipo_usuario']);
        header('Location: ../index.html');
    }

    require 'conecta.php';

?>
<!DOCTYPE html>
<html lang="pt-br">


<!-- edit-profile23:03-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>MediaLab</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
    <div class="main-wrapper">
        <!-- menu principal -->
        <?php
            // chamada do arquivo que contém o menu principal de todas as páginas
            include_once 'menu.php';
        ?>        
        <!-- fim do menu principal -->
        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">Editar Perfil</h4>
                    </div>
                </div>
                <form>
                    <div class="card-box">
                        <h3 class="card-title">Informações Básicas</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="profile-img-wrap">
                                    <img class="inline-block" src="assets/img/user.jpg" alt="user">
                                    <div class="fileupload btn">
                                        <span class="btn-text">editar</span>
                                        <input class="upload" type="file">
                                    </div>
                                </div>
                                <div class="profile-basic">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group form-focus">
                                                <label class="focus-label">Nome</label>
                                                <input type="text" class="form-control floating" value="John">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-focus">
                                                <label class="focus-label">Sobrenome</label>
                                                <input type="text" class="form-control floating" value="Doe">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-focus">
                                                <label class="focus-label">Data de Aniversário</label>
                                                <div class="cal-icon">
                                                    <input class="form-control floating datetimepicker" type="text" value="05/06/1985">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-focus select-focus">
                                                <label class="focus-label">Sexo</label>
                                                <select class="select form-control floating">
                                                    <option value="male selected">Masculino</option>
                                                    <option value="female">Feminino</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-box">
                        <h3 class="card-title">Informações de Contato</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Endereço</label>
                                    <input type="text" class="form-control floating" value="4487 Snowbird Lane">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Estado</label>
                                    <input type="text" class="form-control floating" value="New York">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Cidade</label>
                                    <input type="text" class="form-control floating" value="United States">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">CEP</label>
                                    <input type="text" class="form-control floating" value="10523">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Telefone</label>
                                    <input type="text" class="form-control floating" value="631-889-3206">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-box">
                        <h3 class="card-title">Informações de Educação</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Instituição</label>
                                    <input type="text" class="form-control floating" value="Oxford University">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Assunto</label>
                                    <input type="text" class="form-control floating" value="Computer Science">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Data inicio</label>
									<div class="cal-icon">
										<input type="text" class="form-control floating datetimepicker" value="01/06/2002">
									</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Data fim</label>
									<div class="cal-icon">
										<input type="text" class="form-control floating datetimepicker" value="31/05/2006">
									</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Curso</label>
                                    <input type="text" class="form-control floating" value="BE Computer Science">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Graduação</label>
                                    <input type="text" class="form-control floating" value="Grade A">
                                </div>
                            </div>
                        </div>
                        <div class="add-more">
                            <a href="#" class="btn btn-primary"><i class="fa fa-plus"></i> Add More Institute</a>
                        </div>
                    </div>
                    <div class="card-box">
                        <h3 class="card-title">Experiência Profissional</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Empresa</label>
                                    <input type="text" class="form-control floating" value="Digital Devlopment Inc">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Cidade</label>
                                    <input type="text" class="form-control floating" value="United States">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Cargo</label>
                                    <input type="text" class="form-control floating" value="Web Developer">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Data Inicio</label>
									<div class="cal-icon">
										<input type="text" class="form-control floating datetimepicker" value="01/07/2007">
									</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Data Fim</label>
									<div class="cal-icon">
										<input type="text" class="form-control floating datetimepicker" value="08/06/2018">
									</div>
                                </div>
                            </div>
                        </div>
                        <div class="add-more">
                            <a href="#" class="btn btn-primary"><i class="fa fa-plus"></i> Add More Experience</a>
                        </div>
                    </div>
                    <div class="text-center m-t-20">
                        <button class="btn btn-primary submit-btn" type="button">Save</button>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
    <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/app.js"></script>
</body>


<!-- edit-profile23:05-->
</html>