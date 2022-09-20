<nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" width="110" class="" src="{{url('assets/frontend/img/logo.png')}}" /> <br>
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">{{Auth::user()->name}}</strong>
                             </span> <span class="text-muted text-xs block">{{Auth::user()->role->name}} <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="{{url('settings/profile')}}">Profile</a></li>
                            
                            <li><a href="{{ url('/logout') }}">Logout</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        
                    </div>
                </li>
				 <li @if(Request::segment(1) == "admin" or Request::segment(1) == "dashboard") class="active" @endif><a href="{{ url('dashboard') }}"><i class="fa fa-th-large"></i> <span class="nav-label">Dashboard<span></a></li>
                
				 <li @if(Request::segment(1) == "sales" and Request::segment(2) == "create") class="active" @endif><a href="{{ url('sales/create') }}"><i class="fa fa-diamond"></i> <span class="nav-label">Point of Sale<span></a></li>
				 <li @if(Request::segment(1) == "expenses") class="active" @endif><a href="{{ url('expenses') }}"><i class="fa fa-diamond"></i> <span class="nav-label">Expense<span></a></li>
				 
				  <li @if(Request::segment(1) == "online-orders") class="active" @endif><a href="{{ url('online-orders') }}"><i class="fa fa-list"></i> <span class="nav-label">Online Orders<span></a></li>
				  <li  @if((Request::segment(1) == "orders" or Request::segment(1) == "sales") and Request::segment(2) == "") class="active" @endif>
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">Sales</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li @if(Request::segment(1) == "sales" and Request::segment(2) == "") class="active" @endif><a href="{{ url('sales') }}">POS Sales</a></li>
                        <li @if(Request::segment(1) == "orders" ) class="active" @endif><a href="{{ url('orders') }}">Order Sales</a></li>
                       
                    </ul>
                </li>
				
                    <?php /* <li><a href="{{ url('customers') }}"> <i class="fa fa-users"></i> <span class="nav-label">Customers <span></a></li>
                    <li><a href="{{ url('suppliers') }}"> <i class="fa fa-users"></i> <span class="nav-label">Suppliers <span></a></li> */ ?>
                <li @if((Request::segment(1) == "categories" or Request::segment(1) == "products") and Request::segment(2) == "") class="active" @endif>
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">Products</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li @if(Request::segment(1) == "categories" and Request::segment(2) == "") class="active" @endif><a href="{{ url('categories') }}">Categories</a></li>
                        <li @if(Request::segment(1) == "products" and Request::segment(2) == "") class="active" @endif><a href="{{ url('products') }}">Products</a></li>
                       
                    </ul>
                </li>
                
                   
    <?php /* <li>
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">Inventories</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                       <li><a href="{{ url('inventories/receivings') }}">Receivings</a></li>
                            <li><a href="{{ url('inventories/adjustments') }}">Adjustments</a></li>
                            <li><a href="{{ url('inventories/trackings') }}">Trackings</a></li>
                       
                    </ul>
                </li> */ ?>
            @if(Auth::user()->role_id == 1) 
                <li <?php if(Request::segment(1) == "reports" and (Request::segment(2) == "sales" or Request::segment(2) == "sales_by_products" or Request::segment(2) == "graphs" or Request::segment(2) == "expenses")) { ?>  class="active"; <?php  } ?>>
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">Reporting</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li @if((Request::segment(1) == "reports" and Request::segment(2) == "sales")) class="active" @endif><a href="{{ url('reports/sales') }}">Sales</a></li>
                        <li @if((Request::segment(1) == "reports" and Request::segment(2) == "sales_by_products")) class="active" @endif><a href="{{ url('reports/sales_by_products') }}">Product Sales</a></li>
                        <li @if((Request::segment(1) == "reports" and Request::segment(2) == "graphs")) class="active" @endif><a href="{{ url('reports/graphs') }}">Graphs</a></li>
                        <li @if((Request::segment(1) == "reports" and Request::segment(2) == "expenses")) class="active" @endif><a href="{{ url('reports/expenses') }}">Expenses</a></li>
                       
                    </ul>
                </li>
               
				
				<li @if(Request::segment(1) == "settings" and ((Request::segment(2) == "general" or Request::segment(2) == "html" ))) class="active" @endif>
                    <a href="{{ url('settings/general') }}"><i class="fa fa-users"></i> <span class="nav-label"> Settings</span></a>
                </li>
                
                
                <li @if(Request::segment(1) == "users") class="active" @endif>
                    <a href="{{ url('users') }}"><i class="fa fa-users"></i> <span class="nav-label"> Users</span></a>
                </li>
                
                <li @if((Request::segment(1) == "settings" or Request::segment(1) == "sliders" or Request::segment(1) == "pages") and ((Request::segment(2) == "homepage" or Request::segment(2) == "menu_management"  or Request::segment(2) == ""))) class="active" @endif>
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">Frontend Website</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li @if((Request::segment(2) == "homepage" )) class="active" @endif><a href="{{ url('settings/homepage') }}">Homepage Setting</a></li>
                        <li @if((Request::segment(1) == "sliders" )) class="active" @endif><a href="{{ url('sliders') }}">Sliders</a></li>
                        <li @if((Request::segment(1) == "pages" )) class="active" @endif><a href="{{ url('pages') }}">Pages</a></li>
                        <li @if((Request::segment(2) == "menu_management" )) class="active" @endif><a href="{{ url('settings/menu_management') }}">Menu Management</a></li>
                       
                    </ul>
                </li>
                
                
            @endif
<li @if((Request::segment(2) == "profile" )) class="active" @endif>
                    <a href="{{url('settings/profile')}}"><i class="fa fa-user"></i> <span class="nav-label"> Profile </span></a>
                </li>
				
                <li>
                    <a href="{{ url('logout') }}"><i class="fa fa-sign-out"></i> <span class="nav-label"> Logout </span></a>
                </li>
                
            </ul>

        </div>
    </nav>
