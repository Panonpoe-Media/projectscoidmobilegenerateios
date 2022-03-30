## Aplikasi Projectscoid

# Intro
Modul untuk generate program mobile projects.co.id.
Saran,  ide, pengubahan, laporan mengenai hal-hal yang akan atau telah dikerjakan, beserta masalah-masalah yang muncul dalam pembuatan aplikasi ini dapat ditulis
di [projectscoidmobilegenerate](https://git.projects.co.id/irvan/projectscoidmobilegenerate/blob/master/README.md) dan 
di [Mothership](https://git.projects.co.id/mpri/mothership/blob/master/Templates/MobileApp/static/README.md)

# Tugas Team
Anggota team terdiri dari Pak Priyatna, Pak Insan, Pak Hendra, Irvan.
Pembagian tugas sebagai berikut: (silahkan direvisi ini hanya sekedar gambaran awal, boleh dirubah-rubah supaya efektif).
1. Hal yang paling urgent yang perlu diperhatikan oleh seluruh team adalah generate aplikasi hingga aplikasi dasar bisa terbuat.
2. Semua anggota team diharapkan bisa ikut serta dalam proses generate, penyelesaian masalah yang muncul dalam proses generate hingga hasil dasar
   aplikasi yang layak bisa tercapai. Karena itu disamping mengerjakan tugasnya masing-masing semua harus belajar sampai menguasai 
   sistem dasar generate dan aplikasi sehingga bisa membantu proses penyelesaian generate. Jika dipikirkan dan dikerjakan bersama-sama 
   proses generate ini diharapkan  akan lebih cepat selesai, sehingga proses yang lain bisa dilakukan dengan memakai aplikasi yang sebenarnya.   
3. Irvan proses generate aplikasi dan sistem aplikasi.
4. Pak Hendra pembuatan modul chat.
5. Pak Insan proses testing dan production.
6. Pak Priyatna konsultan dan ketua.
7. Untuk semua anggota team bila ada problem baru dan task baru, atau penyelesaian task atau problem, serta usulan dan saran bisa dituliskan 
   di link [Mothership](https://git.projects.co.id/mpri/mothership/blob/master/Templates/MobileApp/README.md).

# Hasil Generate
Hasil generate dapat dilihat dan ditest di link [Projectscoidmobilegenerate](https://git.projects.co.id/irvan/projectscoidmobilegenerate)

## Getting Started

Program yang digenerate sebagai berikut:
1.  Model.
2.  View.
3.  Controller.
4.  Repository.
5.  Database Repository.
6.  Api.
7.  Sebagian App.
8.  Router.


## New 18-11-2021

- Beta testing open Testing.
- Notif new projects.
 
 
## AUTOGENERATE OFF

- Semua model adalah AUTOGENERATE OFF, sedangkan model base adalah hasil generate, tujuannya adalah untuk override tampilan atau proses-proses tambahan lainnya, untuk
  melengkapi atau mengganti hasil asli dari generate.

# List AUTOGENERATE OFF non model
- Z:\Projectscoid\lib\views\Cart\cart_view.dart
- Z:\Projectscoid\lib\views\BrowseProducts\browse_products_action.dart   => buy add to cart.
- 
 
## Bahan untuk digenerate / research new component, api and user interface.

# Intro
Program dasar yang sudah dibuat yang fungsinya digunakan dalam generate telah dibuat di [projectscoidflutter](https://git.projects.co.id/irvan/projectscoidflutter)
Program dasar ini dapat digunakan untuk mengetes fungsi dan sistem yang akan dipakai dalam generate aplikasi.
# Structure
   - Struktur dari program terdiri dari: 
        - `./api`, folder yang berisi api request dari dan ke server projectscoid di (https://api.projects.co.id). 
        - `./models`, folder yang berisi pengubahan dari json form server ke bentuk model yang akan dipakai di aplikasi dan sebaliknya. 
        - `./core`, folder yang berisi helper dan utility untuk database, api, proses string dll.
    		- `./helper`, folder yang berisi helper untuk color, proses string dll.
    		- `./utility`, folder yang berisi utility untuk app, database, api, proses string dll.
        - `./db`, folder yang berisi pembuatan database untuk proses listing, membuat modul-modul pengaksesan aplikasi ke database.
        - `./repository`, folder yang berisi pengaturan pengaksesan controller aplikasi ke database dan ke api.
        - `./controllers`, folder yang berisi pengatur data yang ditampilkan ke view yang diambil dari repository dan sebaliknya.
    	- `./routers`, folder yang berisi pengaturan perpindahan halaman dalam views.
        - `./views`, folder yang menampilkan data dan mengirim data dari controller.
        - `./app`, folder yang berisi bagian aplikasi yang kebanyakkan tidak digenerate, meliputi login, welcome screen, intro, setting dll.
        - `/main.dart`, program yang bertujuan mengatur config tahapan-tahapan aplikasi: PRODUCTION, STAGING dan DEVELOPMENT.	
    	- `/app.dart`, program yang bertujuan menghubungkan router, repository, controller dengan view.
    	- `/Env.dart`, program untuk mengatur setting di main.dart.	
	
## Data Flow 

# Intro
Aliran data dalam aplikasi ini adalah dibagi empat bagian secara garis besarnya, yaitu data dari server ke aplikasi, data dari aplikasi ke server, 
data yang berhubungan database lokal, data dari halaman / page view ke page view yang lain.

# Data dari server ke aplikasi
Data akan diproses dengan urutan sebagai berikut:
1.  Data dari server akan masuk ke API melalui request yang dikirim oleh api proses ini ada di folder `./api`.
2.  Dari Api data akan masuk ke Models untuk diubah bentuknya dari JSON menjadi model dari aplikasi proses ini ada di folder `./models`.
3.  Model ini akan masuk ke repository, data akan dipilah, apabila data untuk listview maka data akan dimasukan ke dalam database local, kemudian datanya akan dipakai oleh 
    controller, sedang data yang tidak dipakai dalam listview data tidak masuk database lokal tetapi langsung ke controller proses ini ada 
	proses ini ada di folder `./repository` dan di folder `./db`.
4.  Data dari repository akan dipakai oleh controller untuk dikirimkan ke view yang sedang aktif untuk ditampilkan proses ini ada di folder `./controllers`.
5.  Data dari controller akan ditampilkan dalam view yang sedang aktif proses ini ada di folder `./views`.

# Data dari aplikasi ke server
Data akan diproses dengan urutan sebagai berikut:
1.  Data akan dikirim melalui view dengan cara mengisi data yang tersedia dalam inputan dan menekan action tertentu yang didalamnya ada proses pengiriman data,
    data dari inputan itu diubah sesuai dengan model yang ada di dalam aplikasi, proses ini ada di folder `./views`.
2.  Data dari view ini akan masuk ke dalam controller kemudian akan dilanjutkan ke repository proses ini ada di folder `./controllers`.
3.  Data dari controller akan masuk ke repository kemudian dilanjutkan ke api  proses ini ada di folder `./repository`.
4.  Data dari repository akan diubah dari model kebentuk JSON drlanjutnya diproses dengan dio untuk dikirimkan ke server projectscoid proses ini ada di folder `./api`.

# Data dari aplikasi ke database lokal
Data akan diproses sebagai berikut:
1.  Seluruh tabel yang berhubungan dengan listview atau list model akan dibuat di database local proses ini ada di folder `./db`.
2.  Data yang diterima dari server yang berupa listmodel akan diproses untuk disimpan atau tidak ke dalam database lokal dengan persyaratan tertentu
    proses ini ada di folder  `./repository` dan folder `./db`.
3.  Untuk proses penyajian data yang berupa listmodel maka atas pertimbangan tertentu (age data) ada yang diambil dari data yang ada di database lokal proses ini 
    ada di folder  `./repository` dan folder `./db`.

# Data dari page ke page  
Data akan diproses sebagai berikut:
1.  Data dari page dapat di transfer ke page lain sebagai informasi yang akan dipakai untuk request ke server projectscoid, proses ini 
    ada di folder  `./views` dan folder `./routers`.	
	
## Tasks

# Task yang sudah selesai.

- Pembuatan bahan dasar sourcecode yang akan digenerate.
- Pembagian templates berdasarkan kedudukan generatenya, dynamic dan static.
- Penggunaan dan pembuatan component visual dasar untuk menampilkan view dan input yang sesuai dengan design model.
- Penggunaan component untuk pengaksesan rest api ke server projectscoid dengan DIO.
- Penggunaan component untuk router dari page ke page.
- Penggunaan component untuk notifikasi pusher.
- Penggunaan component untuk internasionalisasi.
- Penggunaan component untuk generate model dan JSON.
- Generate view untuk action masalah folder yang tertukar.
- Generate view untuk action masalah dalam menentukan perpindahan page atau pengiriman data ke server.
- Penentuan editable dan tidak field action.
- Parser JSON bertingkat.
- Home controller dan view / belum memakai standar API.
- Database index sudah ditemukan ada di dalam SQLlite.
- Intro.dart view fixed.
- Bila user berbeda database lokal tetap dijadikan satu dengan data yang lama.
- Generate view untuk add.
- Mengunakan metode MVVM.
- Generate view dengan edit apabila controller tidak punya listing menggunakan fields_action dan fields_detail. 
- Penempatan dan pemilihan type view, untuk field expose dalam form.
- Generate model generate field ganda sudah ditangani dengan menambahkan unique disetiap fieldnya seperti : field_action_unique. 
- Metode class base dan class model untuk list item dan model, action dan view sudah bisa. 
- Login dengan ajax=1 di https://test.projects.co.id bisa, dengan menentukan expired date for cookies.
- Generate formdata post.
- Pembuatan API listing dan view.
- Perbaikan auto login dan intro.
- Untuk mendapatkan credit history dan payment history di view finance dengan generate parent_field_id.
- Type inlinetags di edit, list id dan str untuk keseluruhan list yang akan diselect sudah disediakan.
- Untuk type date dan time belum disupport di flutter. Pakai datetime disesuaikan dengan flutter.
- Pembuatan Page informasi projects.co.id.
- Generate action redirect dengan cara hard code melalui model.
- Release program sudah bisa dibuat, terutama untuk android.
- Mengubah com.example.projectsid to co.id.projectscoid in Z:\Projectscoid\android\app\src\main\java\ sudah bisa dilakukan.
- Actionnya yang muncul hanya view saja, yang editnya tidak muncul,contoh di Place New Bid.
- Pembuatan API untuk home, sudah dibuat sehingga view untuk home sudah bisa dibuat sebagian denga benar.
- Error https://api.projects.co.id/public/browse_products/listing dan beberapa url lain sudah diselesaikan.
- API di action ask owner memberikan json model project view.
- Pembuatan API untuk home sudah selesai.
- Pembuatan model, view, controller dan router untuk submodel, subaction dan parent field.
- Melakukan upgrade semua plugin / package setiap bulan.
- Browse Products dan Browse Services, margin2 antar card diperkecil menjadi 5.0.
- Browse Projects, menampilkan deskripsi dari project, versi pendeknya.
- Browse Projects, cardnya apa bisa dibikin variable height? sesuai dengan isi deskripsi? (isi deskripsi dibuat maksimal 400 character).
- Di halaman utama, di app bar terdapat  Shopping Cart, chat dan drawer .
- Create Project, Sell Service, dan Sell Product, Floating Button saja di halaman utama tidak memakai icons di appbar.
- Fungsi search di halaman utama masih nanggung ya, di enter masuk ke halaman baru. Mending sekalian Search dimasukkan ke Floating Button aja, bareng Create Project. 
  Dan tinggal dibawa ke halaman search.
- Di bottom bar (Home, Notif, Projects, dll), itu jangan ada elipsis di "Produc...". Lebih baik disempurnakan tulisannya, diperkecil tulisannya.
- Di tempat Search box tampilkan lagi logo projects.co.id. Tapi itu cocoknya untuk latar putih. Coba aja ganti latar barnya pake warna putih.
- Peletakan harga di Browse Products & Services dibikin satu baris juga, rata kanan, pepetin ke kanan bawah, jangan kasih margin. Kasih padding sedikit. Jangan dikasih WordWrap (multi line). 
- Untuk judul2 di Browse Products dan Browse Services, dibikin satu baris saja. Di clip atau pake elipisis "..." kalau gak muat. Hurufnya agak dibesarin sedikit.
- Di halaman detil Project, Product dan Service jangan ada lagi pemenggalan judul. Judul harus ditampilkan di halaman itu, soalnya itu adalah detail terakhir, 
  gak ada tempat lain untuk menampilkan judul secara lengkap. Di halaman listing, judul boleh dipotong.
- Perbaikan terlambat update state saat setelah log in dan setelah log out.
- Page utama  ada dua header di atas: header pake logo dan button bar/tabbar, button bar/tabbar yang bawah dihapus.
- Header logo yg warna putih dibikin auto hide, kayak sekarang.
- Button bar tetap ada di atas tidak diauto hide.
- Urutan sections: Projects, New Projects, Services, New Services, Products, New Products ... dst.
- Projects, Services dan Products dihilangkan aja dari button bar/tabbar.
- Cart, Chat yang berada di header logo turun ke bawah, ke button bar/tabbar.
- Di header pertama / logo diberi Search button, menggantikan posisi Cart dan Chat.
- Search button merupakan popup menu yang digunakan untuk search projects, products, services, users. 
- Perbaikan view review, comment di  product dan service.
- Perbaikan view user products list and services list.
- Perbaikan view user potofolio.
- Perbaikan review as owner, review as worker, abitrase di view user.
- Untuk splash screen, antara logo projects.co.id dan tulisan “a freelancer marketplace” jarak dan posisinya seperti travelio.
- Pada bagian bawah tengah dikasih icon loading. Font untuk tulisan “a freelancer marketplace” tidak perlu di bold, 
  diperkecil sedikit dari ukuran sekarang  dan pakai aja font seperti #PastiTravelio font PT Serif
- Begitu buka halaman login, kursor langsung diletakkan field username/email dan langsung muncullkan keyboard
- Di halaman login, hapus tulisan “Isi dengan Username Anda” dan hapus tulisan “Isi dengan Password Anda”
- Kata “Log In” jadi “Masuk”, “Register” jadi “Buat Akun”, di button “Create New Projectscoid Account” jadi “Buat Akun” ,“Format Password ?” jadi “Lupa Password?” (tanda tanya nya tidak ada spasi)
  ,“OR” jadi “atau”,di button “Log In” jadi “Masuk”, “User Name or Email” jadi “Username atau alamat email:”,“Password” jadi “Password:”
- Flip background image di view user.
- View dan listing MyProjects.
- View dan listing PastPrjects.
- Notification menggunakan firebase_messaging dan pusher_websocket_flutter.
- Bingkai di header utama dihilangkan aja, paddingnya juga disesuaikan.
- Tambahkan tombol login di halaman utama, bisa beberapa alternatif: a) pake tombol di samping search button.
- Title-title di halaman utama di bikin fix 2 baris. Yang muncul maksimum 2 baris, kalau cuma ada 1 baris, baris kedua jadi spasi. Ini penting buat layout biar seimbang elemen-elemennya.
- Add background texture in main page home.
- Membuat sistem push atau notification yang tetap jalan ketika aplikasi mati. Menggunakan firebase.
- Untuk tampilan detil project, detil user, detil service ... jika ada content yg panjang, misalnya deskripsi. tags, dll, jangan gunakan page baru untuk menampilkannya. 
  Lebih baik gunakan Collapsible/Expandable Panel atau Accordion.
- Routing bertumpuk2 routingnya untuk tag di detail sudah diperbaiki.
- Perbaikan Mekanisme pull to refresh. Khususnya kalau pagenya cuma ada satu. Terjadi perulangan atau menumpuk.
- Mencoba view xml 
  - install dart sdk , letakkan package flutter_xml_widget_creator-master didalam folder Dart tempat sdk di Install. 
  - link generate dijalankan dari flutter_xml_widget_creator-master 'pub run xml_widget_creator ../../../Projectscoid/ [directory]'
  - generate dari Z:\dart\Dart\flutter_xml_widget_creator-master>
- Perbaikan scrolling login.
- Pembuatan fitur camera di my profile.
- Pembuatan user_id di user bid list pada view browse projects. Untuk api sudah ada.
- List user activities lengkap link pagenya (promote page).
- Menggunakan firebase dalam notification.
- https://projects.co.id/public/program/new_secure_code/tw6901 link => untuk secure code
- Fungsi2 pembuatan widget dipecah lagi dan bagian2 yg sama atau sering dipakai, dijadikan fungsi sendiri, misalnya:
   -  showAvatar
   -  showOwnerWithRating
   -  showWorkerWithRating
   -  dll
   bentuk fungsi : https://github.com/rrousselGit/functional_widget
- Pembuatan layout/widget di XML, terus generate ke flutter pake tool itu.
- Harus sudah tidak ada lagi proses pengambilan/pengolahan data dalam pembuatan View, Semuanya sudah berupa variable yg siap pakai.
- Pembuatan user_id di user bid list pada view browse projects. Untuk api belum ada.
- Warna sparator field DBDBDB
- Tulisan "Header" dan "footter" dihilangkan
- Nama Field dengan ":" jangan ada spasi, contohnya "Date:". Margin kirinya dikurangi.
- Value Field diletakkan di sebelah kanan Nama Fieldnya aja...seperti Article, Image, Tags, Inline Tags, dll ... tetap pake dua baris.
- Perhatikan margin kiri kanannya biar seimbang.
- Untuk view arbitrase di user profile,scroll ke bawah loading yang tak berhenti.
- Routing bertumpuk2 routingnya, gak langsung kembali ke halaman depan. Idealnya menjadi :
  Home -> Project Listing -> Project Detail.
  => Navigator.popUntil(context, ModalRoute.withName("/screen2")); ???
  => Navigator.pushReplacementNamed(context, "/projectscoid");
- Pembuatan check connectifity.
- Pembuatan banner button untuk create project.
- Pembuatan scanner scurecode.
- Perbaikan download dengan task process dan notifikasinya.
- Perbaikan/ customisasi list tips, blog, my referals, my profile, my sales, my orders, my purchases, my bookmarks, activities, testimonies, 
  my finance, my pionts.
- Perbaikan guides dan chart.
- Membuat check html string, delete blank lines.
- Perbaikan edit login agar lebih ke tengah.
- Perbaikan error tab notif dan cart ketika login dari guest.
- Implementasi GetWidget.
- Implementasi night mode.
- Kustomisasi create project.
- Pembuatan api list button pada view my projects, view browse projects dan view products dan services. 
- Pembuatan Kustomisasi show treads, show bids, show conversation
- Perbaikan view my account, mybids, myprojects, myprofiles, myorders dan lain-lain.
- biddernya dibawah foto ditampilan usernamenya, bintangnya dan ratingnya.
- Link username di view project sudah jalan.
- Di browse project, judul klo terlalu panjang baris terbawahnya sudah tidak terpotong.
- Pengetesan pengiriman data atau post mengalami kendala, karena program API menggunakan live server,sedangkan
  live server belum bisa/tidak boleh untuk mengetes post, sebagian sudah bisa memaki post.
- Html plugin belum sesuai dengan tampilan yang diharapkan, untuk list dan paragraf. Dapat diatasi dengan htmwidget. 
-




jadi 1 kolom saja seperti browse projects
tombol bid jadi "Order"
tombol "Ask" dihilangkan
text "Budget" jadi "Start from"
"deadline" digeser ke paling kanan
yang ditengah (yang sebelumnya deadline) jadi: "Service Rating" **** (5) di mana angka 5 adalah jumlah penjualan untuk service ini yang sudah done
bagian paling atas nama penjual **** brp point jadi
nama penjual
**** (15) dimana 15 adalah total sales untuk user ini

- Mempelajari kemungkinan generate redirect action.
- Design pengiriman data ke server.
- Pembuatan modul chat.
- Melengkapi view home.
- Upgrade plugin / package setiap bulan.
- Upgrade flutter version.
- Icon di new service dan new product blank di viewnya juga.
- Bagian view projects paling bawah layar utk halaman deskripsi sebaiknya dikasih tombol "Ask Owner", "Bid This Project" dan "Chat Owner"
- Pop up sebelah atas kanan dihilangkan, di view project.
- jarak antar skillnya (antara .NET framework dan visualbasic) bisa lebih dekat nggak ya? berlaku juga udah daftar skill di halaman user profile. saat ini jarak antar barisnya terlalu jauh
- Judul dari user bids adalah User's Bid bukan "User Bids"
- Antara judul dan deskripsi, antara deskripsi dengan "published" cukup dikasih 1 baris kosong.
- Di bawah "published blabla" di bagian tengah dikasih button "View More".
- Popup yang isinya place new bid, ask owner dll itu dihilangkan saja, jadi untuk bisa bid, ask owner dll user harus view more dulu.
- Judul dan/atau deskripsi juga bisa diklik, yang jika diklik akan buka halaman view more.
- Testing post/ pengiriman.
- Pembuatan pembayaran transfer bank.
- Penggunaan table pada list items pada view my order.

# Task yang sedang dan akan dikerjakan
mobile
------
- firebase sering gak masuk
- delete button di cart
- habis Deposit Balance harus kembali ke Cart
- custom URL untuk QRIS Payment & Credit Card
- Edit Profile belum jalan
- Pas masuk Cart muncul "Silahkan Login", (user sudah login, hanya pas awal saja)
- Ping https://projects.co.id/public/program/ping
- Logout https://projects.co.id/public/home/logout
- Subscribe & Subscribe FCM (edited)



## Problems

- urutannya aneh ada yang hilang
- tidak bisa scroll ke atas untuk lihat message sebelumnya. setelah kirim pesan baru, baru bisa scroll ke atas
- di message box terlihat ada message baru, tapi pas di buka messagenya gak muncul. coba back buka lagi kadang bisa kadang gak
- message terbaru dari pak irvan tadi terlihat ada 2 message
  baru lagi dibaca masih di layar yang sama tiba2 tinggal 1 (yang 1 nya lagi hilang)
- notif tidak muncul
- Pembuatan modul chat dibuat secara terpisah dengan modul utama, diharapkan disesuaikan design framework dengan modul utama
  terutama untuk database local, router, rest/http API dan notification , agar mempermudah pengintegrasian.
- Secara umum, sebaiknya semua tulisan dibikin fluid (tinggi box mengikuti contentnya), jadi gak ada tulisan yg terpotong. 

- Api items pada my order view belum stabil.



## Package Modification

- Membuat onTapImage di flutter_widget_from_html_core, untuk zooming image.
- pull_to_refresh karena ada yang deprecated.
- zefyr diganti dengan zefyrka. Dilakukan perbaikan untuk ukuran paragraf.
  di theme.dart
    factory ZefyrThemeData.fallback(BuildContext context) {
    final themeData = Theme.of(context);
    final defaultStyle = DefaultTextStyle.of(context);
    final baseStyle = defaultStyle.style.copyWith(
      fontSize: 16.0,
      height: 1.3,
    );
    ==>final baseSpacing = VerticalSpacing(top: 1.0, bottom: 1.0);
    String? fontFamily;
	
- zefyrka 	
	
- Kendala dalam release adalah package url_launcher, dimana package yang terlibat dengan package ini wrapper grandelnya masih
  ketinggalan, harus diubah ke versi yang lebih atas. url_launcher_macos dan url_launcher_web ke versi gradle-5.4.1-all.zip.
- Karena butuh plugin ini maka perlu hal sebagai berikut :  
    - Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\downloads_path_provider-0.1.0\android\gradle\wrapper
      set to 
      distributionUrl=https\://services.gradle.org/distributions/gradle-5.4.1-all.zip
    - Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\flutter_stetho-0.5.2\android\gradle\wrapper
      set to 
      distributionUrl=https\://services.gradle.org/distributions/gradle-5.4.1-all.zip
      
    -  Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\downloads_path_provider-0.1.0\android\
      build.grundle
      
       dependencies {
              classpath 'com.android.tools.build:gradle:3.3.0'
          }
      
      android {
          compileSdkVersion 28
      
      // TODO(cyanglaz): Remove this hack once androidx.lifecycle is included on stable. https://github.com/flutter/flutter/issues/42348
      afterEvaluate {
          def containsEmbeddingDependencies = false
          for (def configuration : configurations.all) {
              for (def dependency : configuration.dependencies) {
                  if (dependency.group == 'io.flutter' &&
                      dependency.name.startsWith('flutter_embedding') &&
                      dependency.isTransitive())
                  {
                      containsEmbeddingDependencies = true
                      break
                  }
              }
          }
          if (!containsEmbeddingDependencies) {
              android {
                  dependencies {
                      def lifecycle_version = "1.1.1"
                      compileOnly "android.arch.lifecycle:runtime:$lifecycle_version"
                      compileOnly "android.arch.lifecycle:common:$lifecycle_version"
                      compileOnly "android.arch.lifecycle:common-java8:$lifecycle_version"
                  }
              }
          }
      }
      - Perbaikan zefyr di 
      Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\zefyr-1.0.0-dev.2.0\lib\src\widgets
      a. text_selection.dart
         return FadeTransition(
            opacity: _toolbarOpacity,
            child: CompositedTransformFollower(
              link: toolbarLayerLink,
              showWhenUnlinked: false,
              offset: -editingRegion.topLeft,
              child: selectionControls.buildToolbar(
                context,
                editingRegion,
                baseLineHeight,
                midpoint,
                endpoints,
                selectionDelegate,
                clipboardStatus,
      		  Offset(0, 0),
              ),
            ),
          );
        }
      b. text_line.dart
          return RichTextProxy(
            textStyle: text.style,
            textDirection: textDirection,
            strutStyle: strutStyle,
            locale: Localizations.localeOf(context),
            child: RichText(
              text: buildText(context, node),
              textDirection: textDirection,
              strutStyle: strutStyle,
              textScaleFactor: MediaQuery.textScaleFactorOf(context),
            ),
          );
          
          Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\zefyr-1.0.0-dev.2.0\pubspec.yaml
            collection: ^1.14.6
            url_launcher: ^6.0.2
            quill_delta: ^2.0.0


     - Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\notustohtml-0.0.9-dev.3.0\pubspec.yaml
       dependencies:
        notus: ^1.0.0-dev
        quill_delta: ^2.0.0
        html: ^0.15.0
       
    - Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\flutter_local_notifications_platform_interface-2.0.0+1
    dependencies:
      flutter:
        sdk: flutter
      plugin_platform_interface: ^2.0.0
      
      
    - abstract class CookieJar {
        factory CookieJar({bool ignoreExpires = false}) {
          return DefaultCookieJar(ignoreExpires: ignoreExpires);
        }
      
        /// Save the cookies for specified uri.
        void saveFromResponse(Uri uri, List<Cookie> cookies);
      
        /// Load the cookies for specified uri.
        ===>>>> Future<List<Cookie>> loadForRequest(Uri uri);
      
        final bool ignoreExpires;
        
          

## Chat Module

- Untuk tampilan chat module sudah dibuat, tampilan untuk list contact dan tampilan chat. 
- Belum ada fasilitas, upload dan download gambar, belum ada smiley icon list.

## User Interface
User interface yang dibuat menyesuaikan dengan model yang telah di design model bisa 
dilihat di link [Projectscoidmobilegenerate](https://git.projects.co.id/irvan/projectscoidmobilegenerate/tree/master/lib/models).

# User friendly

# Component input dan view design
- Untuk komponen input telah dibuat komponen standar yang berguna untuk fungsi generate, dan dipakai dalam aplikasi.
- Untuk komponen view telah dibuat komponen standar yang berguna untuk fungsi generate, untuk aplikasi komponen ini banyak diganti agar lebih user friendly.

# Form design
- Form dibagi menjadi empat bentuk utama:
  - Form input
  - Form view
  - Form list
  - Form campuran : contoh view cart.

# Text design
- Untuk home page
  - Gunakan softWrap: false untuk text, yg tempatnya cuma satu baris.
  - Mainkan 3 jenis text: 1) 12.0 w600 untuk judul, 2) 11.0 w500 PrimaryDarkColor untuk sub judul 3) 11.0 w500 untuk tulisan lainnya.  
  
# Drawer design
- Untuk drawer dibuat disebelah kiri atas main page, berisi user account, seluruh aktifitas user apabila telah login atau apabila guest akan login dan setting.

# Setting design
- Untuk setting berada dalam drawer, digunakan untuk setting tampilan, intro dan lain-lain.

# Intro design
- Intro dibuat dengan tiga buah page informasi, bagian atas image dan bagian bawah info mengenai projects.co.id. 
- Intro bisa diaktifkan juga non aktif.

# Welcomecreen design
- Menggunakan plugin splashscreen bagian atas terdapat logo projectscoid dan bagian bawah terdapat tulisan 'freelancer marketplace'.

# Main Page Design
- Main page terdiri dari 6 page utama yaitu home, notification, guides, browse products, browse projects, browse services.
- Memiliki link icon untuk cart dan chat di sebelah kanan atas disertai dengan drawer disamping paling kiri atas kemudian diikuti logo projectscoid.

# Notification Design
- Notification menggunakan flutter_local_notifications, kebanyakan digunakan untuk menampilkan informasi dari pusher menggunakan plugin pusher_websocket_flutter. 
- Notification untuk chat menggunakan firebase_messaging.
- Notification menggunakan firebase_messaging dan pusher_websocket_flutter.


## IOS Development

# Penyesuaian dengan XCode
- Ada beberapa component yang dipakai yang perlu setting khusus yang berbeda antara Android dan IOS, 
  karena belum ada pilihan component lain yang tidak perlu kustomisasi.
- Ada kemungkinan pengubahan sedikit code, bila component yang dipakai belum ada pilihan lain yang bisa dipakai tanpa kustomisasi.


## Testing

# Security
- Menggunakan Password dan username dari server.

# Energy Saving
- Energi agak dikeluarkan karena kemungkinan karena ada pusher.

# Memory Uses and Leak
- Menggunakan sistem state dan selalu dispose setiap kelas akan mengurangi kemungkinan memory leak.
- Memory uses perlu dikurangi lagi.

# Responsive
- Responsive dengan menggunakan pengaturan state dengan rxdart dan flutter_bloc.

# Error handling
- Error handling menggunakan sistem bloc, untuk sistem view yang non bloc perlu diperhatikan.

# Integrity
- Integritas data, data yang ada dilokal akan disesuaikan dengan data yang ada di server.
- Data yang berupa list data yang disimpan di data local.
- Data yang berupa search dari list tidak disimpan di data local.

# Easy to Use
- Mudah digunakan karena kebanyakan menggunakan touch screen dalam proses view dan input.

# Consistency
- Data dan tampilan dijaga konsistensinya dengan menggunakan sistem state.

# Compatibility
- Untuk versi android 8, 9, 10. Menggunakan androidx dalam buildnya.

## Production

# IOS

# ANDROID
- Untuk release android telah bisa dilakukan, dengan keystore semetara. 
- Go to [YOUR_PROJECT]\build\app\intermediates\merged_native_libs\release\out\lib
- Package camera dihapus permission camera dan audionya di manifest.
- Kendala dalam release adalah package url_launcher, dimana package yang terlibat dengan package ini wrapper grandelnya masih
  ketinggalan, harus diubah ke versi yang lebih atas. url_launcher_macos dan url_launcher_web ke versi gradle-5.4.1-all.zip.
- Karena butuh plugin ini maka perlu hal sebagai berikut :  
    - Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\downloads_path_provider-0.1.0\android\gradle\wrapper
      set to 
      distributionUrl=https\://services.gradle.org/distributions/gradle-5.4.1-all.zip
    - Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\flutter_stetho-0.5.2\android\gradle\wrapper
      set to 
      distributionUrl=https\://services.gradle.org/distributions/gradle-5.4.1-all.zip
      
    -  Z:\flutter\flutter\.pub-cache\hosted\pub.dartlang.org\downloads_path_provider-0.1.0\android\
      build.grundle
      
       dependencies {
              classpath 'com.android.tools.build:gradle:3.3.0'
          }
      
      android {
          compileSdkVersion 28
      
      // TODO(cyanglaz): Remove this hack once androidx.lifecycle is included on stable. https://github.com/flutter/flutter/issues/42348
      afterEvaluate {
          def containsEmbeddingDependencies = false
          for (def configuration : configurations.all) {
              for (def dependency : configuration.dependencies) {
                  if (dependency.group == 'io.flutter' &&
                      dependency.name.startsWith('flutter_embedding') &&
                      dependency.isTransitive())
                  {
                      containsEmbeddingDependencies = true
                      break
                  }
              }
          }
          if (!containsEmbeddingDependencies) {
              android {
                  dependencies {
                      def lifecycle_version = "1.1.1"
                      compileOnly "android.arch.lifecycle:runtime:$lifecycle_version"
                      compileOnly "android.arch.lifecycle:common:$lifecycle_version"
                      compileOnly "android.arch.lifecycle:common-java8:$lifecycle_version"
                  }
              }
          }
      }
    
## Dll

##Z:\Projectscoid\build\app\intermediates\stripped_native_libs 
Tambahan untuk release di google developer ///
