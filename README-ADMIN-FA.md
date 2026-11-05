# پنل محلی مدیریت هایپر
داده‌ی اولیه شامل 168 محصول فعلی ریپو است. این بسته را روی ریشه‌ی کلون فعلی ریپو کپی کنید و پوشه‌ی تصاویر `products/` را نگه دارید.

## اجرا
نیاز به Node.js دارد؛ وابستگی دیگری ندارد.
```sh
HYPER_ADMIN_PASSWORD='رمز-قوی-محلی' node server.js
```
PowerShell:
```powershell
$env:HYPER_ADMIN_PASSWORD="رمز-قوی-محلی"
node server.js
```
در همان کامپیوتر باز کنید: http://127.0.0.1:4173/admin.html

پنل امکان افزودن، ویرایش و حذف محصول، عکس JPG/PNG/WebP، قیمت به تومان و موجودی را دارد. داده‌ها در `products.json` و `products.js` نوشته می‌شوند؛ منوی `index.html` از `products.js` می‌خواند. تصویرهای تازه نیز در پوشه‌ی `products/` قرار می‌گیرند.


## راه‌اندازی ویندوز با کلیک
در کامپیوتر شرکت ابتدا Git و Node.js را نصب کنید، سپس این ریپو را Clone کنید. برای دفعات بعدی، در پوشه‌ی پروژه روی فایل start-admin-windows.bat دوبار کلیک کنید، رمز محلی را وارد کنید و پنل در مرورگر باز می‌شود. برای ساخت Shortcut دسکتاپ، روی همان فایل راست‌کلیک کنید و گزینه‌ی Send to > Desktop (create shortcut) را بزنید. پنجره‌ی سرور را تا پایان کار باز نگه دارید.

برای اولین دریافت پروژه:

    git clone https://github.com/amir-ghaderian/hyper.git

برای دریافت تغییرات جدید در همان پوشه:

    git pull

## انتشار در Vercel
پس از بازبینی:
```sh
git status
git add index.html admin.html server.js products.js products.json products/
git commit -m "Add local product admin"
git push
```
منوی عمومی و داده‌های استاتیک در Vercel منتشر می‌شوند. پنل به سرور محلی Node احتیاج دارد و در Vercel استاتیک API اجرا نمی‌شود. سرور فقط روی `127.0.0.1` در دسترس است؛ این نسخه برای استفاده روی همان کامپیوتر است، نه دسترسی کارمندان از دستگاه‌های دیگر.
