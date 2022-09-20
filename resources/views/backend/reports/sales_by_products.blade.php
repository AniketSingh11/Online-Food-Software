@extends('layouts.app')

@section('content')


<div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Products by Sales  </h5>
                       
                    </div>
                    <div class="ibox-content">

                        <div class="table-responsive">
                   <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Product Name</th>
                            <th>Sales </th>
                        </tr>
                    </thead>
                    <tbody>
                    @if (!empty($sales_by_product))
                        @forelse ($sales_by_product as $key => $item)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>{{ $item->product_name }}</td>
                                <td>{{ $item->total_sales }}</td>
								
		
								
                            </tr>
                        @empty
                          <tr> 
						  <td colspan="5">
								  No Record Found
									
                                </td>
								</tr>
                        @endforelse
                    @endif
                    </tbody>
                </table>
                        </div>

                    </div>
                </div>
            </div>
            </div>
           
        </div>
		
@endsection
