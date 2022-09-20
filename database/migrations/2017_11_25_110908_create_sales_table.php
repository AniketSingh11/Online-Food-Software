<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSalesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sales', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('customer_id')->nullable()->default(0);
			$table->integer('cashier_id')->nullable();
			$table->string('comments')->nullable();
			$table->timestamps();
			$table->boolean('status')->nullable()->default(1)->comment('1:completed, 0 canceled');
			$table->float('amount', 10)->default(0.00);
			$table->float('discount', 10)->nullable()->default(0.00);
			$table->float('vat', 10)->nullable()->default(0.00);
			$table->float('delivery_cost', 10)->nullable()->default(0.00);
			$table->string('name', 100)->nullable();
			$table->string('email')->nullable();
			$table->string('phone', 20)->nullable();
			$table->string('address')->nullable();
			$table->string('comment', 500)->nullable();
			$table->string('type', 10)->nullable()->default('pos');
			$table->enum('payment_with', array('card','cash'))->nullable()->default('cash');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('sales');
	}

}
