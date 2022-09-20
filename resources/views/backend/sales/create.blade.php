@extends('layouts.app')

@section('content')
<?php $currency =  setting_by_key("currency"); ?>
   <link href="{{url('assets/css/plugins/sweetalert/sweetalert.css')}}" rel="stylesheet">
   <link href="{{url('assets/css/plugins/toastr/toastr.min.css')}}" rel="stylesheet">
 <script src="{{url('assets/js/plugins/toastr/toastr.min.js')}}"></script>
 <script src="{{url('assets/js/plugins/sweetalert/sweetalert.min.js')}}"></script>
<div class="wrapper wrapper-content animated fadeInRight">
     
            <div class="row">
                <div class="col-lg-8">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                        <div class="toolbar mb2 mt2">
                        <button class="btn fil-cat" href="" data-rel="all">All</button>
                          
                          @foreach($categories as $category)
                          <button class="btn fil-cat" data-rel="{{$category->id}}">{{ $category->name }}</button>
                          @endforeach
                          
                        </div> 

                          
                        </div>
                        
                         <div id="portfolio">
                        @foreach($products as $product)
        
                            <div class="col-lg-3 {{$product->category_id}} all">                       
                                <div class="widget white-bg text-center">
                                    <div class="m-b-md">
                                        <img width="100px" alt="image" class="img-circle" src="{{url('uploads/products/thumb/' . $product->id . '.jpg')}}">
                                        <!-- <img src="img/pizza.jpg" class="img-responsive"> -->
                                        <h4 class="m-xs heading-size">{{$product->name}}</h4>
            <?php 
                                        $prices = json_decode($product->prices); 
                                        $titles = json_decode($product->titles); 
                                        
            ?>
                                        @foreach($titles as $key=>$t)
                            
                                        <button data-price="{{$prices[$key]}}" data-id="{{$product->id}}" data-key="{{$key}}" data-size="{{$t}}" data-name="{{$product->name}}" type="button" class="btn btn-primary m-r-sm AddToCart tag-margin
tag-btn">{{substr($t , 0, 1)}}</button>

                                   
                                        @endforeach
                                        
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="ibox">
                            <div class="ibox-title">
                                <h5>Cart Items</h5>                        
                            </div>
                            <div class="ibox-content">
                            <div id="CartHTML">
                                
                            </div>
                
                            
                            
                            </div>
                            <div class="panel-footer green-bg">
                                        <h4 class="col-lg-6"><strong>Total</strong></h4>
                                        <h4 class="col-lg-6 text-right TotalAmount"> 0 </h4>
                                </div>
                        </div>
                    </div>
                </div>                
                <div class="col-lg-4">
                    <div class="row">
                        <div class="ibox">
                            <div class="ibox-title">
                                <h5>Finish Sale</h5>                        
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                    <input type="hidden" id="cashier_id" class="form-control" value="{{Auth::user()->id}}">
                                    <input type="hidden" id="customer_id" class="form-control" value="1">
                                    <input type="hidden" id="vat" class="form-control" value="0.00">
                                    <input type="hidden" id="delivery_cost" class="form-control" value="0">
                                    
                                    <input type="text" id="discount" placeholder="Discount" class="form-control" >
                                    <input type="text" id="comments" placeholder="Comment" class="form-control">
                                </div>                                
                            </div>

                            <div class="no-mar no-pad">                                    
                                <button type="button" id="completeOrder" class="btn btn-primary btn-block text-center">Order Confirm</button>
                                
                                 <button type="button" id="ClearCart" class="btn btn-danger btn-block text-center">Clear Cart</button>
                                 
                            </div>
                        </div>
                    </div>
                </div>    
                
           
            </div></div>
<script src="{{url('assets/js/lodash.min.js')}}"></script>
   
<script>

toastr.options = {
              "closeButton": true,
              "debug": false,
              "progressBar": true,
              "preventDuplicates": false,
              "positionClass": "toast-top-right",
              "onclick": null,
              "showDuration": "400",
              "hideDuration": "1000",
              "timeOut": "2000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
            
var products = new Array();
var cart = new Array();
$("body").on("click" , ".AddToCart" , function() {
            var ids = _.map(cart, 'id');
                var item = {
                    id : $(this).attr("data-id") + $(this).attr("data-key"),
                    product_id : $(this).attr("data-id"),
                    price : $(this).attr("data-price"),
                    size : $(this).attr("data-size"),
                    name : $(this).attr("data-name")
                };
                
            if (!_.includes(ids, item.id)) {
                item.quantity = 1;
                item.p_qty = 1;
                cart.push(item);
            } else {
                var index = _.findIndex(cart, item);
                 cart[index].quantity = cart[index].quantity + 1
            }
            

        toastr.success('Successfully Added to Cart')            
        show_cart();    
            
    
});


$("body").on("click" , "#ClearCart" , function() {
    
    var cart = [];
            $(".TotalAmount").html(0);
            $("#CartHTML").html("");
    });
$("body").on("click" , ".DecreaseToCart" , function() {
                var item = {
                    id : $(this).attr("data-id")
                };
            var index = _.findIndex(cart, item);
            
            if (cart[index].quantity == 1) {
                deleteItemFromCart(item);
            } else {
                cart[index].quantity = cart[index].quantity - 1;
            }    
            //console.log(cart[index].quantity);
         //toastr.success('Successfully Updated')       
        show_cart();            
    
});

$("body").on("click" , ".IncreaseToCart" , function() {	
                var item = {
                    id : $(this).attr("data-id")
                };
            var index = _.findIndex(cart, item);
            cart[index].quantity = cart[index].quantity + 1;        
            show_cart();            
    
});

$("body").on("click" , ".DeleteItem" , function() {
                var item = {
                    id : $(this).attr("data-id")
                };    
                
            deleteItemFromCart(item);
});

$("body").on("click" , ".DiscountItem" , function() {
                
});

function deleteItemFromCart(item) { 
    var index = _.findIndex(cart, item);
    cart.splice(index, 1);
    show_cart();
}

$("body").on("click" , "#completeOrder" , function() {
                    if(cart.length  < 1) {
                        swal("" , "Cart is Empty" , "error");
                        return false;
                    }                    
                    var form_data = {
                    comments: $("#comments").val(),
                    discount: $("#discount").val(),
                    cashier_id: $("#cashier_id").val(),
                    vat: $("#vat").val(),
                    delivery_cost: $("#delivery_cost").val(),
                    customer_id: $("#customer_id").val(),
                    items: _.map(cart, function(cart){
                        return {
                            product_id: cart.product_id,
                            size: cart.size,
                            quantity: cart.quantity,
                            price: cart.price
                        }
                    })
                    };
                    
                    $("#completeOrder").html('<i class="fa fa-spinner fa-spin" style="font-size:18px"></i>');
                    $("#completeOrder").prop("disabled" , true);
                    
                    
                    $.ajax({
                        type: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        url: '<?php echo url("sales/complete_sale"); ?>',
                        data: form_data,
                        success: function (msg) {
                            cart = [];
                            $("#comments").val("");
                            $("#completeOrder").html('Order Confirm');
                            $("#completeOrder").prop("disabled" , false);
                            swal({
                              title: 'Sale Completed',
                              type: 'success',
                              text: ''
                            }).then(
                              function () {
                                  window.open(msg , "_blank");
                              }
                            )

                            show_cart();
                        }    
                    });
                    
});



function show_cart() { 
         if(cart.length > 0) { 
         var qty = 0;
         var total = 0;
         var cart_html = "";
             var obj = cart; 
                 $.each( obj, function( key, value ) {

                      cart_html += '<div class="row"><div class="col-lg-12 list-margin"><div class="col-lg-4"><h4>' + value.name + '</h4></div>';
                      cart_html += '<div class="col-lg-1 no-pad"><button type="button" class="btn btn-primary btn-circle text-center IncreaseToCart" data-id=' +  value.id + '>+</button></div>';
                     cart_html += '<div class="col-lg-2 text-center"><span id="quantity"> ' + value.quantity +'</span> </div>';
                      cart_html += '<div class="col-lg-1 no-pad"><button type="button" class="btn btn-primary btn-circle text-center DecreaseToCart" data-id=' +  value.id + '>-</button></div>';
                      
                        cart_html += '<div class="col-lg-3 text-center"><h5> <?php echo $currency; ?>'+ value.price + '</h5> </div>'
                        cart_html += '<div class="col-lg-1 no-pad"><button type="button" class="btn btn-danger btn-circle text-center DeleteItem" data-id=' +  value.id + '>x</button></div>';
                        
                        cart_html += '</div></div>'

                        
                     qty = Number(value.quantity);
                     total = Number(total) + Number(value.price * qty);
                     
                 });
                  var vat = (Number(total) * <?php echo setting_by_key("vat"); ?>)/100;
                 cart_html += '<div class="row"><div class="col-lg-12 list-margin"><div class="col-lg-10"><h4>VAT(<?php echo setting_by_key("vat"); ?>%)</h4></div>';
                 cart_html += '<div class="col-lg-2"><h4><?php echo $currency; ?>' + vat + '</h4></div>';
                 cart_html += '</div></div>';
                 
                 // cart_html += '<div class="panel-footer"> Total Items' ;
                 // cart_html += '<span class="pull-right"> ' + qty ;
                 // cart_html += '</span></div>' ;
                 
                 var total_amount = Number(total) + vat;
				 
				 $("#vat").val(vat);
				 
                 $(".TotalAmount").html("<?php echo $currency; ?>" + total_amount.toFixed(2));
                 $("#CartHTML").html("");
                 $("#CartHTML").html(cart_html);
        } else { 
            $(".TotalAmount").html(0);
            $("#CartHTML").html("");
        }
        
}
            
</script>

<style>
.cart-item {
    max-height: 160px;
    overflow-y: scroll;
}


.scale-anm {
  transform: scale(1);
}


.tile { 
    -webkit-transform: scale(0);
    transform: scale(0);
    -webkit-transition: all 350ms ease;
    transition: all 350ms ease;

}
.tile:hover { 

}

</style>

<script> 
$(function() {
        var selectedClass = "";
        $(".fil-cat").click(function(){ 
        selectedClass = $(this).attr("data-rel"); 
     $("#portfolio").fadeTo(100, 0.1);
        $("#portfolio > div").not("."+selectedClass).fadeOut().removeClass('scale-anm');
    setTimeout(function() {
      $("."+selectedClass).fadeIn().addClass('scale-anm');
      $("#portfolio").fadeTo(300, 1);
    }, 300); 
        
    });
});
</script>

@endsection
