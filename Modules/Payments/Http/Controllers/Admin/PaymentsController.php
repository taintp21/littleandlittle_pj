<?php

namespace Modules\Payments\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Payments\Entities\Payments;
use Modules\Payments\Http\Requests\CreatePaymentsRequest;
use Modules\Payments\Http\Requests\UpdatePaymentsRequest;
use Modules\Payments\Repositories\PaymentsRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

use Illuminate\Support\Facades\DB;

class PaymentsController extends AdminBaseController
{
    /**
     * @var PaymentsRepository
     */
    private $payments;

    public function __construct(PaymentsRepository $payments)
    {
        parent::__construct();

        $this->payments = $payments;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $payments = DB::table('payments')->get();

        return view('payments::admin.payments.index', compact('payments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('payments::admin.payments.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreatePaymentsRequest $request
     * @return Response
     */
    public function store(CreatePaymentsRequest $request)
    {
        $this->payments->create($request->all());

        return redirect()->route('admin.payments.payments.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('payments::payments.title.payments')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Payments $payments
     * @return Response
     */
    public function edit(Payments $payments)
    {
        return view('payments::admin.payments.edit', compact('payments'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Payments $payments
     * @param  UpdatePaymentsRequest $request
     * @return Response
     */
    public function update(Payments $payments, UpdatePaymentsRequest $request)
    {
        $this->payments->update($payments, $request->all());

        return redirect()->route('admin.payments.payments.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('payments::payments.title.payments')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Payments $payments
     * @return Response
     */
    public function destroy(Payments $payments)
    {
        $this->payments->destroy($payments);

        return redirect()->route('admin.payments.payments.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('payments::payments.title.payments')]));
    }
}
