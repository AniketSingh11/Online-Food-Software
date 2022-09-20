<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateHomepageTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('homepage', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('key', 100)->unique('settings_key_unique');
			$table->string('type', 10)->nullable();
			$table->string('label', 100);
			$table->text('value', 65535);
			$table->timestamps();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('homepage');
	}

}
