<?php

namespace Modules\Page\Http\Controllers;

use Illuminate\Contracts\Foundation\Application;
use Modules\Core\Http\Controllers\BasePublicController;
use Modules\Menu\Repositories\MenuItemRepository;
use Modules\Page\Entities\Page;
use Modules\Page\Repositories\PageRepository;

use Illuminate\Http\Request;
use App\Mail\ContactMail;
use App\Mail\SendTicketMail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class PublicController extends BasePublicController
{
    /**
     * @var PageRepository
     */
    private $page;
    /**
     * @var Application
     */
    private $app;

    private $disabledPage = false;

    public function __construct(PageRepository $page, Application $app)
    {
        parent::__construct();
        $this->page = $page;
        $this->app = $app;
    }

    /**
     * @param $slug
     * @return \Illuminate\View\View
     */
    public function uri($slug)
    {
        $page = $this->findPageForSlug($slug);

        $this->throw404IfNotFound($page);

        $currentTranslatedPage = $page->getTranslation(locale());
        if ($slug !== $currentTranslatedPage->slug) {

            return redirect()->to($currentTranslatedPage->locale . '/' . $currentTranslatedPage->slug, 301);
        }

        $template = $this->getTemplateForPage($page);

        $alternate = $this->getAlternateMetaData($page);

        return view($template, compact('page', 'alternate'));
    }

    /**
     * @return \Illuminate\View\View
     */
    public function homepage()
    {
        $page = $this->page->findHomepage();

        $this->throw404IfNotFound($page);

        $template = $this->getTemplateForPage($page);

        $alternate = $this->getAlternateMetaData($page);

        return view($template, compact('page', 'alternate'));
    }

    /**
     * Find a page for the given slug.
     * The slug can be a 'composed' slug via the Menu
     * @param string $slug
     * @return Page
     */
    private function findPageForSlug($slug)
    {
        $menuItem = app(MenuItemRepository::class)->findByUriInLanguage($slug, locale());

        if ($menuItem) {
            return $this->page->find($menuItem->page_id);
        }

        return $this->page->findBySlug($slug);
    }

    /**
     * Return the template for the given page
     * or the default template if none found
     * @param $page
     * @return string
     */
    private function getTemplateForPage($page)
    {
        return (view()->exists($page->template)) ? $page->template : 'default';
    }

    /**
     * Throw a 404 error page if the given page is not found or draft
     * @param $page
     */
    private function throw404IfNotFound($page)
    {
        if (null === $page || $page->status === $this->disabledPage) {
            $this->app->abort('404');
        }
    }

    /**
     * Create a key=>value array for alternate links
     *
     * @param $page
     *
     * @return array
     */
    private function getAlternateMetaData($page)
    {
        $translations = $page->getTranslationsArray();

        $alternate = [];
        foreach ($translations as $locale => $data) {
            $alternate[$locale] = $data['slug'];
        }

        return $alternate;
    }

    /* Custom */
    public function sukien(){
        $sukien = DB::table('event__event_translations')
                    ->join('event__events', 'event__event_translations.event_id', '=', 'event__events.id')
                    ->where('event__events.status', '=', 2)
                    ->get();
        return view('sukien', compact('sukien'));
    }

    public function chitiet_sukien($slug){
        $chitiet_sukien = DB::table('event__event_translations')->where('slug', "=",$slug)->first();
        return view('chitiet_sukien', compact('chitiet_sukien','slug'));
    }

    public function sendEmail(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'max:50'],
            'email' => ['required', 'regex:/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix'],
            'phone' => ['required', 'min:10'],
            'address' => ['nullable', 'max:100'],
            'message' => ['required', 'max:300']
        ],[
            'name.required' => 'Ho?? t??n kh??ng ????????c ?????? tr????ng',
            'name.max' => 'T????i ??a 50 ky?? t????',
            'email.required' => 'Ch??a nh???p email',
            'email.regex' => 'Sai ?????nh d???ng email',
            'phone.required' => 'S???? ??i????n thoa??i kh??ng ????????c ?????? tr????ng',
            'phone.min' => 'T????i thi????u 10 s????',
            'address.max' => 'T????i ??a 100 ky?? t????',
            'message.required' => 'L????i nh????n kh??ng ????????c ?????? tr????ng',
            'message.max' => 'T????i ??a 300 ky?? t????'
        ]);
        if ($validator->fails()) {
            return redirect('en/lien-he')->withErrors($validator)->withInput();
        }
        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'message' => $request->message
        ];
        Mail::to('taintp21@gmail.com')->send(new ContactMail($data));
        return redirect()->back()->with('messageSuccess', 'G???i li??n h??? th??nh c??ng.<br> Vui l??ng ki??n nh???n ?????i ph???n h???i t??? ch??ng t??i, b???n nh??!');
    }

    public function formThanhToan(){
        return view('thanhtoan');
    }
    public function createPayment(Request $request){
        /* payment */
        $vnp_Version = "2.1.0";
        $vnp_Command = "pay";
        $vnp_TmnCode = env('VNP_TMN_CODE');
        $vnp_Amount = $request->giatien * 100; // vnpay *100
        $vnp_CurrCode = "VND";
        $vnp_IpAddr = $request->server("REMOTE_ADDR");
        $vnp_Locale = "vn";
        $vnp_OrderInfo = "Thanh toa??n ve??";
        $vnp_ReturnUrl = url('vnpay/return');
        $vnp_TxnRef = randString(15);

        $inputData = array(
            "vnp_Version" => $vnp_Version,
            "vnp_Command" => $vnp_Command,
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => $vnp_CurrCode,
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_ReturnUrl" => $vnp_ReturnUrl,
            "vnp_TxnRef" => $vnp_TxnRef //M?? ????n h??ng. Trong th???c t??? Merchant c???n insert ????n h??ng v??o DB v?? g???i m?? n??y sang VNPAY
        );

        ksort($inputData);

        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = env('VNP_URL') . "?" . $query;
        if (env('VNP_HASH_SECRET')) {
            $vnpSecureHash =   hash_hmac('sha512', $hashdata, env('VNP_HASH_SECRET'));//
            $vnp_Url .= 'vnp_SecureHashType=SHA512&vnp_SecureHash=' . $vnpSecureHash;
        }

        //validate
        if($request->method() == 'POST'){
            $validator = Validator::make($request->all(), [
                'soluong' => ['required', 'numeric', 'max:100'],
                'ngaysudung' => ['required'],
                'hoten' => ['required', 'max:50'],
                'dienthoai' => ['required', 'max:14'],
                'email' => ['required', 'regex:/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix'],
                'sothe' => ['required'],
                'hotenchuthe' => ['required'],
                'ngayhethan' => ['required'],
                'cvvcvc' => ['required', 'regex:/^[0-9]{3,4}$/'],
            ],[
                'soluong.required' => 'Nh???p s??? l?????ng v?? c???n mua',
                'soluong.numeric' => 'Ph???i l?? s???!',
                'soluong.max' => 'Gi???i h???n t???i ??a 100 m???i l???n mua v??',
                'ngaysudung.required' => 'Ch??a nh???p ng??y s??? d???ng v??',
                'hoten.required' => 'Ch??a nh???p th??ng tin li??n h???',
                'hoten.max' => 'T???i ??a 50 k?? t???',
                'dienthoai.required' => 'Ch??a nh???p s??? ??i???n tho???i',
                'dienthoai.max' => 'S??? ??i???n tho???i t???i ??a 14 k?? t???',
                'email.required' => 'Ch??a nh???p email',
                'email.regex' => 'Sai ?????nh d???ng email',
                'sothe.required' => 'Ch??a nh???p s??? th???!',
                'hotenchuthe.required' => 'Ch??a nh???p h??? t??n ch??? th???!',
                'hotenchuthe.regex' => "Ho?? t??n vi????t kh??ng d????u",
                'ngayhethan.required' => 'Ch??a nh???p ng??y h???t h???n th???',
                'cvvcvc.required' => 'Ch??a nh???p CVV/CVC',
                'cvvcvc.regex' => 'Sai CVV/CVC'
            ]);
            if ($validator->fails()) {
                return redirect('en/form-thanhtoan')
                    ->with('validator','H??nh nh?? ???? c?? l???i x???y ra khi thanh to??n... <br>Vui l??ng ki???m tra l???i th??ng tin li??n h???, th??ng tin th??? v?? th??? l???i.')
                    ->withErrors($validator)
                    ->withInput();
            }
        }
        //Add info
        DB::table('payments')->insert([
            'vnp_TxnRef' => $vnp_TxnRef,
            'giatien' => $request->input('giatien'),
            'soluong' => $request->input('soluong'),
            'ngaysudung' => $request->input('ngaysudung'),
            'hoten' => $request->input('hoten'),
            'dienthoai' => $request->input('dienthoai'),
            'email' => $request->input('email'),
            'sothe' => $request->input('sothe'),
            'hotenchuthe' => $request->input('hotenchuthe'),
            'ngayhethan' => $request->input('ngayhethan'),
            'cvvcvc' => $request->input('cvvcvc')
        ]);
        
        return redirect($vnp_Url);
    }

    public function vnpayReturn(Request $request){
        $vnp_TxnRef = $request->query("vnp_TxnRef");
        $paymentInfo = DB::table("payments")->where("vnp_TxnRef", $vnp_TxnRef)->first();
        $QRvnp_TxnRef = $vnp_TxnRef."|".$paymentInfo->giatien."|".$paymentInfo->soluong."|".$paymentInfo->ngaysudung."|".$paymentInfo->hoten."|".$paymentInfo->dienthoai."|".$paymentInfo->email;
        $generateQR = QrCode::size(150)->generate($QRvnp_TxnRef);

        $vnp_ResponseCode = $request->query("vnp_ResponseCode");
        if($vnp_ResponseCode == 00) return view('payment_return', compact('vnp_TxnRef', 'QRvnp_TxnRef', 'generateQR', 'paymentInfo'));
        if($vnp_ResponseCode == 7) return view("payment_return_fail")->with("message", "Tr??? ti???n th??nh c??ng. Giao d???ch b??? nghi ng??? (li??n quan t???i l???a ?????o, giao d???ch b???t th?????ng).");
        if($vnp_ResponseCode == 9) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: Th???/T??i kho???n c???a kh??ch h??ng ch??a ????ng k?? d???ch v??? InternetBanking t???i ng??n h??ng.");
        if($vnp_ResponseCode == 10) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: Kh??ch h??ng x??c th???c th??ng tin th???/t??i kho???n kh??ng ????ng qu?? 3 l???n");
        if($vnp_ResponseCode == 11) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: ???? h???t h???n ch??? thanh to??n. Xin qu?? kh??ch vui l??ng th???c hi???n l???i giao d???ch.");
        if($vnp_ResponseCode == 12) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: Th???/T??i kho???n c???a kh??ch h??ng b??? kh??a.");
        if($vnp_ResponseCode == 13) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do Qu?? kh??ch nh???p sai m???t kh???u x??c th???c giao d???ch (OTP). Xin qu?? kh??ch vui l??ng th???c hi???n l???i giao d???ch.");
        if($vnp_ResponseCode == 24) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: Kh??ch h??ng h???y giao d???ch");
        if($vnp_ResponseCode == 51) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: T??i kho???n c???a qu?? kh??ch kh??ng ????? s??? d?? ????? th???c hi???n giao d???ch.");
        if($vnp_ResponseCode == 65) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: T??i kho???n c???a Qu?? kh??ch ???? v?????t qu?? h???n m???c giao d???ch trong ng??y.");
        if($vnp_ResponseCode == 75) return view("payment_return_fail")->with("message", "Ng??n h??ng thanh to??n ??ang b???o tr??.");
        if($vnp_ResponseCode == 79) return view("payment_return_fail")->with("message", "Giao d???ch kh??ng th??nh c??ng do: KH nh???p sai m???t kh???u thanh to??n qu?? s??? l???n quy ?????nh. Xin qu?? kh??ch vui l??ng th???c hi???n l???i giao d???ch");
        if($vnp_ResponseCode == 99) return view("payment_return_fail")->with("message", "L????i");
    }

    public function sendTicketEmail(Request $request){
        $sendTicketData = [
            'vnp_TxnRef' => $request->vnp_TxnRef,
            'giatien' => $request->giatien,
            'soluong' => $request->soluong,
            'ngaysudung' => $request->ngaysudung,
            'hoten' => $request->hoten,
            'dienthoai' => $request->dienthoai,
            'email' => $request->email
        ];
        Mail::to($request->email)->send(new SendTicketMail($sendTicketData));
        return redirect()->back()->with('messageSuccess', '??a?? g????i email tha??nh c??ng!');
    }
}
