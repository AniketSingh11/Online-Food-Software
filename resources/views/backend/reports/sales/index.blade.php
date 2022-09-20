@extends('layouts.app')

@section('content')
<?php $input['date_range'] = !empty($input['date_range']) ? $input['date_range'] : null; 
$currency =  setting_by_key("currency");
?>
<link href="{{url('assets/css/plugins/datapicker/datepicker3.css')}}" rel="stylesheet">

 <link href="{{url('assets/css/plugins/daterangepicker/daterangepicker-bs3.css')}}" rel="stylesheet">

<div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Sales</h5>
                        
                    </div>
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                           <tr>
                            <th>#</th>
                             <th>Sales Date</th>
							<th>Amount</th>
                            <th>Discount</th>
                            <th>Total Amount</th>
                            <th></th>
                        </tr>
                            </thead>
                            <tbody>
							<?php $total_discount=0;$total_amount = 0; ?>
                    @if (!empty($sales))
                        @forelse ($sales as $key => $sale)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                               <td>{{ date('d F Y' , strtotime($sale->created_at)) }}</td>
                                
							   <td>{{$currency}} {{ $sale->amount}}</td>
                                <td>{{$currency}} {{ $sale->discount }}</td>
                                <td>{{$currency}} {{ $sale->amount }}</td>
                                <td>
                                    <a href="{{ url('reports/sales/' . $sale->id) }}" class="btn btn-primary btn-xs pull-right">Show</a>
                                </td>
                            </tr>
							<?php $total_amount += $sale->amount; ?>
							<?php $total_discount += $sale->discount; ?>
                        @empty
                            @include('backend.partials.table-blank-slate', ['colspan' => 5])
                        @endforelse
                    @endif
                    </tbody>
					
						<tr>
                                <th>{{count($sales)}}</th>
                                <td></td>
                                
							    <th>{{$currency}} {{ $total_amount }}</th>
                                <th>{{$currency}} {{ $total_discount }}</th>
                                <th>{{$currency}} {{ $total_amount - $total_discount }}</th>
                                <th> Total Amount : </th>
                                <th>{{$currency}} {{ $total_amount - $total_discount }}</th>
                               
                            </tr>
							
							
                        </table>

                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
            <div class="panel panel-default">
                 <div class="ibox-title">
                        <h5>Date Range</h5>
                        
                    </div>
                 <div class="ibox-content">    
                    <form action="{{ url('reports/sales') }}" method="GET">
                        <div class="form-group">
                            <label for="price">Date Range</label>
                            <select class="form-control" id="date-range" name="date_range">
                                <option>-- Select Date Range --</option>
                                <option value="today" {{ ($input['date_range'] == 'today') ? 'selected="selected"' : '' }}>Today</option>
                                <option value="current_week" {{ ($input['date_range'] == 'current_week') ? 'selected="selected"' : '' }}>This Week</option>
                                <option value="current_month" {{ ($input['date_range'] == 'current_month') ? 'selected="selected"' : '' }}>This Month</option>
                                <option value="custom_date" {{ ($input['date_range'] == 'custom_date') ? 'selected="selected"' : '' }}>Custom Date</option>
								
								
                            </select>
                        </div>
						
						<div class="form-group" id="data_5">
                                <label class="font-noraml">Range select</label>
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control" name="start" value="{{(!empty($input['start']) and $input['start'] !=  '') ? $input['start'] : '' }}"/>
                                    <span class="input-group-addon">to</span>
                                    <input type="text" class="input-sm form-control" name="end" value="{{ (!empty($input['end']) and $input['end'] !=  '') ? $input['end'] : '' }}" />
                                </div>
                            </div>

                        

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </div>
</div>
	<!-- Date range use moment.js same as full calendar plugin -->
	
	 <!-- Data picker -->
   <script src="{{url('assets/js/plugins/datapicker/bootstrap-datepicker.js')}}"></script>

    <script src="{{url('assets/js/plugins/fullcalendar/moment.min.js')}}"></script>
    <script src="{{url('assets/js/plugins/daterangepicker/daterangepicker.js')}}"></script>
	
			<script> 
			$('#data_5 .input-daterange').datepicker({
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });
			</script>

@endsection
