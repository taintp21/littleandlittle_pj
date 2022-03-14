<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendTicketMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $sendTicketData;
    public function __construct($sendTicketData)
    {
        $this->sendTicketData = $sendTicketData;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('sendTicket')
        ->subject('Gửi vé đã thanh toán')
        ->from('taintp.testmail@gmail.com', 'Little & Little')
        ->with('data',$this->sendTicketData);
    }
}
