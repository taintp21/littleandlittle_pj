<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentsPaymentsTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments__payments_translations', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            // Your translatable fields

            $table->integer('payments_id')->unsigned();
            $table->string('locale')->index();
            $table->unique(['payments_id', 'locale']);
            $table->foreign('payments_id')->references('id')->on('payments__payments')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('payments__payments_translations', function (Blueprint $table) {
            $table->dropForeign(['payments_id']);
        });
        Schema::dropIfExists('payments__payments_translations');
    }
}
