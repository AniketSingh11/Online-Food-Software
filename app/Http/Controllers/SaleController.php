<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Sale;
use App\Category;
use App\Product;
use Auth;
use Validator;

class SaleController extends Controller
{
    public function index()
    {
        if(Auth::user()->role_id == 1) { 
            $data['sales'] = Sale::select("*" , "sales.id as id")->where("type", "pos")->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy("sales.id", "DESC")->paginate(25);
        } else { 
            $data['sales'] = Sale::where("cashier_id", Auth::user()->id)->leftJoin("sale_items as s" , "s.sale_id" , '=', "sales.id" )->orderBy("sales.id", "DESC")->paginate(25);
        }
        
        return view('backend.sales.index', $data);
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::get();
        $products = Product::get();
        return view('backend.sales.create', ['products' => $products,'categories' => $categories]);
    }

    public function receipt($id)
    {
        $data = [
            'sale' => Sale::findOrFail($id),
        ];

        return view('backend.sales.receipt', $data);
    }
    
    public function completeSale(Request $request)
    {
        $form = $request->all();
		$items = $request->input('items');
		$amount = 0;
		foreach($items as $item) { 
			$amount += $item['price'] * $item['quantity'];
		}	
		$amount += $request->input('vat') + $request->input('delivery_cost') - $request->input('discount');
		$form['amount'] = $amount;
		
		 $rules = Sale::$rules;
        $rules['items'] = 'required';

        $validator = Validator::make($form, $rules);

        if ($validator->fails()) {
            return response()->json(
                [
                'errors' => $validator->errors()->all(),
                ], 400
            );
        }
        $sale = Sale::createAll($form);

        return url("sales/receipt/".$sale->id);
    }
    
    public function cancel($id)
    {
        Sale::where("id", $id)->update(array("status" => 0));
        return redirect("sales");
    }
    
}
