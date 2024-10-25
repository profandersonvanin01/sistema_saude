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


<!-- menu principal -->
<div class="header">
			<div class="header-left">
				<a href="index.php" class="logo">
					<img src="assets/img/logo.png" width="35" height="35" alt=""> <span>MediaLab</span>
				</a>
			</div>
			<a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
            <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
            <ul class="nav user-menu float-right">
                <li class="nav-item dropdown has-arrow">
                    <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img">
							<img class="rounded-circle" src="assets/img/user.jpg" width="24" alt="Administrador">
							<span class="status online"></span>
						</span>
						<!-- <span>Admin</span> -->
                         <span><?php echo ucfirst($_SESSION['nome_usuario']); ?></span>
                    </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="profile.html">Meu Perfil</a>
						<a class="dropdown-item" href="edit-profile.html">Editar Perfil</a>
						<a class="dropdown-item" href="settings.html">Ajustes</a>
						<a class="dropdown-item" href="logout.php">Sair</a>
					</div>
                </li>
            </ul>
            <div class="dropdown mobile-user-menu float-right">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="profile.html">Meu Perfil</a>
                    <a class="dropdown-item" href="edit-profile.html">Editar Perfil</a>
                    <a class="dropdown-item" href="settings.html">Ajustes</a>
                    <a class="dropdown-item" href="login.html">Sair</a>
                </div>
            </div>
        </div>
        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">Principal</li>
                        <li class="active">
                            <a href="index.php"><i class="fa fa-dashboard"></i> <span>Painel</span></a>
                        </li>
						<li>
                            <a href="doctors.php"><i class="fa fa-user-md"></i> <span>Doutores</span></a>
                        </li>
                        <li>
                            <a href="patients.php"><i class="fa fa-wheelchair"></i> <span>Pacientes</span></a>
                        </li>
                        <li>
                            <a href="appointments.php"><i class="fa fa-calendar"></i> <span>Agendamentos</span></a>
                        </li>
                        <!-- <li>
                            <a href="schedule.html"><i class="fa fa-calendar-check-o"></i> <span>Doctor Schedule</span></a>
                        </li> -->
                        <li>
                            <a href="departments.php"><i class="fa fa-hospital-o"></i> <span>Departamentos</span></a>
                        </li>
						<li class="submenu">
							<a href="#"><i class="fa fa-user"></i> <span> Funcionários </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="employees.php">Lista de Funcionários</a></li>								
							</ul>
						</li>						
                        <li>
                            <a href="settings.php"><i class="fa fa-cog"></i> <span>Configurações</span></a>
                        </li>
                        
                        <li>
                            <a href="calendar.php"><i class="fa fa-calendar"></i> <span>Calendário</span></a>
                        </li>
                        
                        
                    </ul>
                </div>
            </div>
        </div>
        <!-- fim do menu principal -->