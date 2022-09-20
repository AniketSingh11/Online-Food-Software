<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::get('db_import', "HomeController@import");

Route::group(['middlewareGroups' => 'web'], function () {
	Route::get('logout', 'Auth\LoginController@logout');
	Route::get('/', 'HomeController@index');
	Route::get('/about', 'HomeController@about');
	Route::get('/faq', 'HomeController@faqs');
	Route::get('/terms-condition', 'HomeController@termsCondition');
	Route::get('/our-menu', 'HomeController@ourMenu');
	Route::get('/contact-us', 'HomeController@contact');
	Route::post('contact/save', 'HomeController@contactSave');
	//Route::get('{slug}' , "HomeController@pagesView");

	//// Email Testing
	Route::get('/testmail', 'HomeController@testMail');


	Route::get('/admin', 'DashboardController@index')->name('home');
	Route::get('/dashboard', 'DashboardController@index')->name('home');


	Route::post('newsletter/store', "NewsletterController@store");
	Route::post('sales/online_order', 'OrderController@completeSale');
});

Route::group(
    ['middleware' => 'auth'], function () {
        Route::resource('categories', 'CategoryController');
        Route::resource('customers', 'CustomerController');
        Route::resource('suppliers', 'SupplierController');
        Route::resource('products', 'ProductController');
       
        Route::resource('users', 'UserController');
        Route::post('product/upload_photo', 'ProductController@uploadPhoto');
        Route::post('product/upload_photo_crop', 'ProductController@updatePhotoCrop');
        Route::post('category/upload_photo_crop', 'CategoryController@updatePhotoCrop');

    
        Route::resource('sales', 'SaleController', ['only' => ['create', 'store']]);
        Route::get('sales/receipt/{id}', 'SaleController@receipt');
        Route::post('sales/complete_sale', 'SaleController@completeSale');
        Route::get('sales/', 'SaleController@index');
        Route::get('sales/cancel/{id}', 'SaleController@cancel');
    
        // Route::group(
            // ['prefix' => 'inventories'], function () {
                // Route::resource('receivings', 'ReceivingController', ['except' => ['edit', 'update', 'destroy']]);
                // Route::resource('adjustments', 'AdjustmentController', ['except' => ['edit', 'update', 'destroy']]);
                // Route::get('trackings', 'TrackingController@index');
            // }
        // );
    
    
       
        Route::get('reports/sales_by_products', 'ReportController@SalesByProduct');
        Route::get('reports/graphs', 'ReportController@Graphs');
        Route::get('reports/expenses', 'ReportController@expenses');
		 Route::get('reports/{type}', 'ReportController@index');
        Route::get('reports/{type}/{id}', 'ReportController@show');
    
    
        /// Pages Controller 
            
        Route::get('/pages', 'PageController@index');
        Route::post('/pages/save', 'PageController@save');
        Route::get('/pages/add', 'PageController@add');
        Route::get('/pages/delete/{id}', 'PageController@delete');
        Route::get('/pages/edit/{id}', 'PageController@edit');
        //// Slider 
        Route::get("/sliders", 'SliderController@index');
        Route::post("slider/save", 'SliderController@save');
        Route::post("slider/get", 'SliderController@get');
        Route::post("slider/delete", 'SliderController@delete');
		
		//// Slider 
        Route::get("/expenses", 'ExpenseController@index');
        Route::post("expenses/save", 'ExpenseController@store');
        Route::post("expenses/get", 'ExpenseController@get');
        Route::post("expenses/delete", 'ExpenseController@delete');
        // Editor 
        Route::get('editor/html', 'EditorController@siteHtml');
        Route::post('html/save', 'EditorController@saveHtml');
            
        /// Orders 
        Route::get("online-orders", "OrderController@index");
        Route::get("orders", "OrderController@orders");
        Route::post("orders/save", "OrderController@ChangeStatus");
   
        Route::group(
            ['prefix' => 'settings'], function () {
                Route::get('homepage', 'SettingController@homePage');
                Route::post('homepage', 'SettingController@homePageUpdate');
                Route::get('profile', 'ProfileController@edit');
                Route::post('profile', 'ProfileController@update');
                Route::get('general', 'SettingController@edit');
                Route::post('general', 'SettingController@update');
				Route::post('update_password', 'ProfileController@updatePassword');
                Route::get('menu_management', 'SettingController@MenuManagement');
                Route::post('/menu/save', 'SettingController@saveList');
                Route::post('/menu/save_removed', 'SettingController@saveRemoved');
        
                Route::resource('roles', 'RoleController');
                Route::resource('permissions', 'PermissionController');
            }
        );
    
    }
);