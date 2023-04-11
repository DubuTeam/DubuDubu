<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>

<!-- Page Wrapper -->
<div id="wrapper">
	<!-- Sidebar -->
  	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">THIS IS DUBU</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>부서목록</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">


    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>영업</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/orderList">주문서관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/salesIst">제품입고등록</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/salesIstSearch">제품입고조회</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/salesOust">제품출고등록</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/salesOustSearch">제품출고조회</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/salesStc">완제품LOT재고조회</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-cog"></i>
            <span>생산</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            	<a class="collapse-item" href="${pageContext.request.contextPath}/prcProcess">제품공정흐름관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/prcs">공정관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/plan">생산계획</a>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/planSearch">생산계획조회XXX</a> --%>
                <a class="collapse-item" href="${pageContext.request.contextPath}/indica">생산지시</a>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/indicaSearch">생산지시조회XXX</a> --%>
                <a class="collapse-item" href="${pageContext.request.contextPath}/progMng">생산관리</a>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/prcsSearch">생산실적조회XXX</a> --%>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#aaa"
            aria-expanded="true" aria-controls="aaa">
            <i class="fas fa-fw fa-cog"></i>
            <span>설비</span>
        </a>
        <div id="aaa" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/eqLine">라인관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/eq">설비관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/eqCheck">설비점검내역</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/eqIpopr">비가동관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/equIp">실시간설비상태</a>
            </div>
        </div>
    </li>
    
        <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#bbb"
            aria-expanded="true" aria-controls="bbb">
            <i class="fas fa-fw fa-cog"></i>
            <span>자재</span>
        </a>
        <div id="bbb" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/materialOrder">자재발주관리</a>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/materialOrderSearch">자재발주조회</a> --%>
                <a class="collapse-item" href="${pageContext.request.contextPath}/materialIst">자재입고관리</a>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/materialIstList">자재입고조회XXX</a> --%>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/materialOust">원자재출고관리△△△</a> --%>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/materialOustList">원자재출고조회XXX</a> --%>
                <a class="collapse-item" href="${pageContext.request.contextPath}/materialStcList">자재재고조회</a>
                <%-- <a class="collapse-item" href="${pageContext.request.contextPath}/materialLOTList">자재LOT재고조회</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/materialIOList">자재입/출고조회</a> --%>
            </div>
        </div>
    </li>
    
        <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#ccc"
            aria-expanded="true" aria-controls="ccc">
            <i class="fas fa-fw fa-cog"></i>
            <span>품질</span>
        </a>
        <div id="ccc" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/prdtInsp">제품검사관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/materialInsp">자재입고검사관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/materialInspList">자재입고검사조회</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    
  </ul>
  <!-- End of Sidebar -->
  
  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
  
    <!-- Main Content -->
    <div id="content">

     <!-- Topbar -->
     <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

       <!-- Sidebar Toggle (Topbar) -->
       <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
           <i class="fa fa-bars"></i>
       </button>

       <!-- Topbar Search -->
       <form
           class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
           <div class="input-group">
               <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                   aria-label="Search" aria-describedby="basic-addon2">
               <div class="input-group-append">
                   <button class="btn btn-primary" type="button">
                       <i class="fas fa-search fa-sm"></i>
                   </button>
               </div>
           </div>
       </form>

       <!-- Topbar Navbar -->
       <ul class="navbar-nav ml-auto">

           <!-- Nav Item - Search Dropdown (Visible Only XS) -->
           <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                  aria-labelledby="searchDropdown">
                  <form class="form-inline mr-auto w-100 navbar-search">
                      <div class="input-group">
                          <input type="text" class="form-control bg-light border-0 small"
                              placeholder="Search for..." aria-label="Search"
                              aria-describedby="basic-addon2">
                          <div class="input-group-append">
                              <button class="btn btn-primary" type="button">
                                  <i class="fas fa-search fa-sm"></i>
                              </button>
                          </div>
                      </div>
                  </form>
              </div>
           </li>

           <!-- Nav Item - Alerts -->
           <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-bell fa-fw"></i>
                  <!-- Counter - Alerts -->
                  <span class="badge badge-danger badge-counter">3+</span>
              </a>
	           <!-- Dropdown - Alerts -->
	           <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
	               aria-labelledby="alertsDropdown">
	               <h6 class="dropdown-header">
	                   Alerts Center
	               </h6>
	               <a class="dropdown-item d-flex align-items-center" href="#">
	                   <div class="mr-3">
	                       <div class="icon-circle bg-primary">
	                           <i class="fas fa-file-alt text-white"></i>
	                       </div>
	                   </div>
	                   <div>
	                       <div class="small text-gray-500">December 12, 2019</div>
	                       <span class="font-weight-bold">A new monthly report is ready to download!</span>
	                   </div>
	               </a>
	               <a class="dropdown-item d-flex align-items-center" href="#">
	                   <div class="mr-3">
	                       <div class="icon-circle bg-success">
	                           <i class="fas fa-donate text-white"></i>
	                       </div>
	                   </div>
	                   <div>
	                       <div class="small text-gray-500">December 7, 2019</div>
	                       $290.29 has been deposited into your account!
	                   </div>
	               </a>
	               <a class="dropdown-item d-flex align-items-center" href="#">
	                   <div class="mr-3">
	                       <div class="icon-circle bg-warning">
	                           <i class="fas fa-exclamation-triangle text-white"></i>
	                       </div>
	                   </div>
	                   <div>
	                       <div class="small text-gray-500">December 2, 2019</div>
	                       Spending Alert: We've noticed unusually high spending for your account.
	                   </div>
	               </a>
	               <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
	           </div>
           </li>

           <!-- Nav Item - Messages -->
           <li class="nav-item dropdown no-arrow mx-1">
               <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <i class="fas fa-envelope fa-fw"></i>
                   <!-- Counter - Messages -->
                   <span class="badge badge-danger badge-counter">7</span>
               </a>
               <!-- Dropdown - Messages -->
               <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                   aria-labelledby="messagesDropdown">
                   <h6 class="dropdown-header">
                       Message Center
                   </h6>
                   <a class="dropdown-item d-flex align-items-center" href="#">
                       <div class="dropdown-list-image mr-3">
                           <img class="rounded-circle" src="img/undraw_profile_1.svg" alt="...">
                           <div class="status-indicator bg-success"></div>
                       </div>
                       <div class="font-weight-bold">
                           <div class="text-truncate">Hi there! I am wondering if you can help me with a
                               problem I've been having.</div>
                           <div class="small text-gray-500">Emily Fowler · 58m</div>
                       </div>
                   </a>
                   <a class="dropdown-item d-flex align-items-center" href="#">
                       <div class="dropdown-list-image mr-3">
                           <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
                           <div class="status-indicator"></div>
                       </div>
                       <div>
                           <div class="text-truncate">I have the photos that you ordered last month, how
                               would you like them sent to you?</div>
                           <div class="small text-gray-500">Jae Chun · 1d</div>
                       </div>
                   </a>
                   <a class="dropdown-item d-flex align-items-center" href="#">
                       <div class="dropdown-list-image mr-3">
                           <img class="rounded-circle" src="img/undraw_profile_3.svg" alt="...">
                           <div class="status-indicator bg-warning"></div>
                       </div>
                       <div>
                           <div class="text-truncate">Last month's report looks great, I am very happy with
                               the progress so far, keep up the good work!</div>
                           <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                       </div>
                   </a>
                   <a class="dropdown-item d-flex align-items-center" href="#">
                       <div class="dropdown-list-image mr-3">
                           <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                               alt="...">
                           <div class="status-indicator bg-success"></div>
                       </div>
                       <div>
                           <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                               told me that people say this to all dogs, even if they aren't good...</div>
                           <div class="small text-gray-500">Chicken the Dog · 2w</div>
                       </div>
                   </a>
                   <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
               </div>
           </li>

           <div class="topbar-divider d-none d-sm-block"></div>

           <!-- Nav Item - User Information -->
           <li class="nav-item dropdown no-arrow">
               <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                   <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/images/undraw_profile.svg">
               </a>
               <!-- Dropdown - User Information -->
               <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                   aria-labelledby="userDropdown">
                   <a class="dropdown-item" href="#">
                       <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                       Profile
                   </a>
                   <a class="dropdown-item" href="#">
                       <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                       Settings
                   </a>
                   <a class="dropdown-item" href="#">
                       <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                       Activity Log
                   </a>
                   <div class="dropdown-divider"></div>
                   <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                       <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                       Logout
                   </a>
               </div>
           </li>

       </ul>

     </nav>
     <!-- End of Topbar -->



