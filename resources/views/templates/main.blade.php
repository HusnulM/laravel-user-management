<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>@yield('title')</title>
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/datepicker3.css" rel="stylesheet">
	<link href="/css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
    @yield('addtional-css')
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="#">USER MANAGEMENT</a>
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
                        <a class="" data-toggle="dropdown" style="color:white;" href="#">
						    <!-- <em class="fa fa-user"></em><span class="label label-success"></span> -->
                            User Accounts
					    </a>
						<ul class="dropdown-menu">
							<!-- <li>
                                <a href="#" class="btn btn-default">
                                    <span class="label label-danger"></span>
                                    <div class="message-body">
                                        <em class="fa fa-user"></em> <strong> Profile</strong>
                                    </div>
                                </a>
							</li>
							<li class="divider"></li> -->
							<li>
								<form action="{{ url('logout') }}" method="post">
									@csrf
									<button type="submit" class="btn btn-default form-control" style="margin-left:6px;">
										<i class="fa fa-power-off"></i> <strong> Logout</strong>
									</button>
								</form>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
        <!-- /.container-fluid -->
	</nav>

    <!-- Sidebar -->
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<!-- <div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div> -->
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">{{ Auth::user()->name }}</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<!-- <form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form> -->
		<ul class="nav menu">
			<li class=""><a href="{{ url('/') }}"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>
			@foreach(userMenu() as $headMenu)
				<li class="parent">
				    <a data-toggle="collapse" href="#{{$headMenu->menugroup}}">
						<em class="fa fa-navicon">&nbsp;</em> {{ $headMenu->groupname }} 
						<span data-toggle="collapse" href="#{{$headMenu->menugroup}}" 
							class="icon pull-right"><em class="fa fa-plus"></em>
						</span>
					</a>
                   <ul class="children collapse" id="{{$headMenu->menugroup}}">
                   @foreach(userSubMenu() as $detailMenu)
                       @if($headMenu->menugroup === $detailMenu->menugroup)
                           <li>
                               <a href="{{ url($detailMenu->route) }}">
                                   <i class="metismenu-icon"></i>
                                   {{ $detailMenu->menuname }}
                               </a>
                           </li>
                       @endif
                   @endforeach
                   </ul>
               </li>
			@endforeach
			
			<!-- <li><a href="widgets.html"><em class="fa fa-calendar">&nbsp;</em> Widgets</a></li>
			<li><a href="charts.html"><em class="fa fa-bar-chart">&nbsp;</em> Charts</a></li>
			<li><a href="elements.html"><em class="fa fa-toggle-off">&nbsp;</em> UI Elements</a></li>
			<li><a href="panels.html"><em class="fa fa-clone">&nbsp;</em> Alerts &amp; Panels</a></li> -->
		</ul>
	</div>
    <!--/.sidebar-->
	
    <!-- Content -->
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <br>
        @yield('content')
	</div>	
    <!--/.Content-->
	
	<script src="/js/jquery-1.11.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/chart.min.js"></script>
	<script src="/js/chart-data.js"></script>
	<script src="/js/easypiechart.js"></script>
	<script src="/js/easypiechart-data.js"></script>
	<script src="/js/bootstrap-datepicker.js"></script>
	<script src="/js/custom.js"></script>
	
    @yield('additional-js')
		
</body>
</html>

@yield('modals')