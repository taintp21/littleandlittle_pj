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
            'name.required' => 'Họ tên không được để trống',
            'name.max' => 'Tối đa 50 ký tự',
            'email.required' => 'Chưa nhập email',
            'email.regex' => 'Sai định dạng email',
            'phone.required' => 'Số điện thoại không được để trống',
            'phone.min' => 'Tối thiểu 10 số',
            'address.max' => 'Tối đa 100 ký tự',
            'message.required' => 'Lời nhắn không được để trống',
            'message.max' => 'Tối đa 300 ký tự'
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
        return redirect()->back()->with('messageSuccess', 'Gửi liên hệ thành công.<br> Vui lòng kiên nhẫn đợi phản hồi từ chúng tôi, bạn nhé!');
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
        $vnp_OrderInfo = "Thanh toán vé";
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
            "vnp_TxnRef" => $vnp_TxnRef //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
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
                'soluong.required' => 'Nhập số lượng vé cần mua',
                'soluong.numeric' => 'Phải là số!',
                'soluong.max' => 'Giới hạn tối đa 100 mỗi lần mua vé',
                'ngaysudung.required' => 'Chưa nhập ngày sử dụng vé',
                'hoten.required' => 'Chưa nhập thông tin liên hệ',
                'hoten.max' => 'Tối đa 50 ký tự',
                'dienthoai.required' => 'Chưa nhập số điện thoại',
                'dienthoai.max' => 'Số điện thoại tối đa 14 ký tự',
                'email.required' => 'Chưa nhập email',
                'email.regex' => 'Sai định dạng email',
                'sothe.required' => 'Chưa nhập số thẻ!',
                'hotenchuthe.required' => 'Chưa nhập họ tên chủ thẻ!',
                'hotenchuthe.regex' => "Họ tên viết không dấu",
                'ngayhethan.required' => 'Chưa nhập ngày hết hạn thẻ',
                'cvvcvc.required' => 'Chưa nhập CVV/CVC',
                'cvvcvc.regex' => 'Sai CVV/CVC'
            ]);
            if ($validator->fails()) {
                return redirect('en/form-thanhtoan')
                    ->with('validator','Hình như đã có lỗi xảy ra khi thanh toán... <br>Vui lòng kiểm tra lại thông tin liên hệ, thông tin thẻ và thử lại.')
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
        if($vnp_ResponseCode == 7) return view("payment_return_fail")->with("message", "Trừ tiền thành công. Giao dịch bị nghi ngờ (liên quan tới lừa đảo, giao dịch bất thường).");
        if($vnp_ResponseCode == 9) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng chưa đăng ký dịch vụ InternetBanking tại ngân hàng.");
        if($vnp_ResponseCode == 10) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: Khách hàng xác thực thông tin thẻ/tài khoản không đúng quá 3 lần");
        if($vnp_ResponseCode == 11) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: Đã hết hạn chờ thanh toán. Xin quý khách vui lòng thực hiện lại giao dịch.");
        if($vnp_ResponseCode == 12) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng bị khóa.");
        if($vnp_ResponseCode == 13) return view("payment_return_fail")->with("message", "Giao dịch không thành công do Quý khách nhập sai mật khẩu xác thực giao dịch (OTP). Xin quý khách vui lòng thực hiện lại giao dịch.");
        if($vnp_ResponseCode == 24) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: Khách hàng hủy giao dịch");
        if($vnp_ResponseCode == 51) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: Tài khoản của quý khách không đủ số dư để thực hiện giao dịch.");
        if($vnp_ResponseCode == 65) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: Tài khoản của Quý khách đã vượt quá hạn mức giao dịch trong ngày.");
        if($vnp_ResponseCode == 75) return view("payment_return_fail")->with("message", "Ngân hàng thanh toán đang bảo trì.");
        if($vnp_ResponseCode == 79) return view("payment_return_fail")->with("message", "Giao dịch không thành công do: KH nhập sai mật khẩu thanh toán quá số lần quy định. Xin quý khách vui lòng thực hiện lại giao dịch");
        if($vnp_ResponseCode == 99) return view("payment_return_fail")->with("message", "Lỗi");
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
        return redirect()->back()->with('messageSuccess', 'Đã gửi email thành công!');
    }
}
