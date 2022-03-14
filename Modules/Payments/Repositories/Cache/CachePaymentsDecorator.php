<?php

namespace Modules\Payments\Repositories\Cache;

use Modules\Payments\Repositories\PaymentsRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CachePaymentsDecorator extends BaseCacheDecorator implements PaymentsRepository
{
    public function __construct(PaymentsRepository $payments)
    {
        parent::__construct();
        $this->entityName = 'payments.payments';
        $this->repository = $payments;
    }
}
