<?php

namespace App\Http\Controllers;

use App\Sale;
use App\Product;
use App\Expense;
use DB;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	 
	 
	
	
    public function index(Request $request , $type)
    {
        $form = $request->all();
		$data['input'] = $form;
		$date_range = $request->input('date_range'); 
		$start = $request->input('start');
		$end = $request->input('end');
		
			$query = DB::table("sales");
			if($date_range == "today") {
				$query->whereDay('sales.created_at', '=', date('d'));
			}
			if($date_range == "current_week") {
				$query->where('sales.created_at', '>=', date('Y-m-d h:i:s' , strtotime("-7 days")));
			}
			if($date_range == "current_month") {
				$query->whereMonth('sales.created_at', '=', date('m'));
			}
			
			if($date_range == "custom_date") {
				$query->where('sales.created_at', '>=', date('Y-m-d' , strtotime($start)));
				$query->where('sales.created_at', '<=', date('Y-m-d' , strtotime($end)));
				
			}
			
			$data['sales'] = $query->select("*" , "sales.id as id")->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy('sales.created_at', 'DESC')->get();
			

        return view('backend.reports.'.$type.'.index', $data);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function show($type, $id)
    {
        $data = [];
        $data['sale'] = Sale::find($id);
		return view('backend.reports.'.$type.'.show', $data);
    }
	
	
	public function SalesByProduct() { 
		$sales_by_product = DB::select("SELECT  SUM(quantity) as total_sales,product_id FROM sale_items GROUP BY (product_id) ORDER BY total_sales DESC");
        if(!empty($sales_by_product)) { 
			foreach($sales_by_product as $sale) {
				 $sale->product_id;
				 $s = Product::find($sale->product_id);
				 $sale->product_name = "";
				 if(!empty($s))
				 $sale->product_name = $s->name;
				 
			}
		}
        $data["sales_by_product"] = $sales_by_product;
	
        return view('backend.reports.sales_by_products', $data);
	}	
	
	public function Graphs() { 
		$data['transections_7_days'] = $this->getRevenueRransections(7);
		$data['transections_30_days'] = $this->getRevenueRransections(30);
        $data['get_orders_365'] = $this->getRevenueTransectionsYearly(365);
		
		$data['transections_7_days_online'] = $this->getRevenueRransections(7 , 'order');
		$data['transections_30_days_online'] = $this->getRevenueRransections(30, 'order');
        $data['get_orders_365_online'] = $this->getRevenueTransectionsYearly(365, 'order');
		
		 return view('backend.reports.graphs', $data);
	}	
	
	public function expenses() { 
		
		if(!empty($_GET['start']) and !empty($_GET['end'])) { 
			$start = $_GET['start'] . " 00:00:00";
			$end = $_GET['end'] . " 23:59:00";
			$data['expenses'] = Expense::where("created_at" , ">=" , $start)->where("created_at" , "<=" , $end)->paginate(20);
		} else { 
			$data['expenses'] = Expense::paginate(20);
		}
		
		return view('backend.reports.expenses', $data);
	}
	
	
	
	
	
	
	
	
	
	
	
	 public function getRevenueRransections($date_difference="" , $type="pos") {
        $where = "";
		$today='';
        if($today != ""){
            $where = "DATE(created_at) = '".date("Y-m-d")."'";
        } else {
            $where = "created_at BETWEEN NOW() - INTERVAL ".$date_difference." DAY AND NOW()";
        }
        $query = DB::select("SELECT SUM(amount) as amount, DATE_FORMAT(created_at,'%W') as day, DATE_FORMAT(created_at,'%d') as dat, DATE_FORMAT(created_at,'%M') as mon, created_at as dated FROM `sales` WHERE type='$type' AND  ".$where." GROUP BY DATE(created_at) ORDER BY created_at DESC");
        return $query;
    }
	
	public function getRevenueTransectionsYearly($date_difference="" , $type="pos") {
        $where = "";
        if($date_difference != ""){
            $where = "created_at BETWEEN NOW() - INTERVAL ".$date_difference." DAY AND NOW()";
        }
		
		$query = DB::select("SELECT SUM(amount) as amount, DATE_FORMAT(created_at,'%W') as day, DATE_FORMAT(created_at,'%d') as dat, DATE_FORMAT(created_at,'%M') as mon, created_at as dated FROM `sales` WHERE  type='$type' AND ".$where." GROUP BY MONTH(created_at) ORDER BY created_at DESC");
        return $query;
		
  
    }
	
	
}
