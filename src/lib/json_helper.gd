extends Node

var default_pemain = {
            ve = '0-beta1',#versi database
            na = "Tester", #nama
            ap = 5,   #apel
            ko = 500, #koin
            st = 3, #bintang stage
            wt = 0, #waktu total
            ws = 0, #waktu session
            achievement = [[1,1], [2,1]],    #(id,step)
            jb = [[1,1], [1,2]], #stage yang terbuka (jilid, bab)
            fjb = [[1,1,3]],     #stage yang diselesaikan (jilid, bab, bintang)
            rune = [],           #aksara yang dimiliki (id, jumlah)
            items = {}           #barang yang dimiliki (id, jumlah)
        } setget , get_pemain
var default_penghargaan = [
       [1, "Petualang Pemula", "Berhasil menyelesaikan satu jilid dengan 3 bintang", "res://asset/ui/utility/cover/ach_pemula.png"],
       [2, "Kolektor Apel", "Berhasil mengumpulkan 10 apel", "res://asset/ui/utility/cover/ach_kolektor_apel.png"],
       [3, "Pahlawan Desa", "Berhasil membantu 5 permintaan pada 5 desa berbeda", "res://asset/ui/utility/cover/ach_pahlawan.png"],
       [4, "Arkeolog", "Berhasil menemukan 5 catatan bersejarah dalam reruntuhan kuno", "res://asset/ui/utility/cover/ach_arkeolog.png"],
       [5, "Hartawan", "Menemukan harta yang berharga dalam reruntuhan kuno", "res://asset/ui/utility/cover/ach_harta.png"],
       [6, "Lupa Waktu", "Telah bermain selama 56 jam", "res://asset/ui/utility/cover/ach_waktu.png"]
    ] setget , get_penghargaan
var default_jilid = [
       [1, "Pulau Padi", "res://asset/ui/utility/cover/map_1.png"],
       [2, "Negeri Emas", "res://asset/ui/utility/cover/map_2.png"],
       ] setget , get_jilid
var default_bab = [
       [1,1, "Batu Raden", 
          ["Dulu, dikisahkan ada seorang pemuda yang bernama Suta yang merupakan seorang abdi kadipaten yang baik hati. Suatu hari, ia menyelamatkan putri adipati dari seekor ular raksasa. Karena kejadian tersebut membuat keduanya menjadi jatuh hati. Karena hubungan keduanya tak direstui oleh adipati, Suta dipenjara bawah tanah. ",
           "Hal tersebut membuat putri adipati tak tega dan memerintahkan pada abdi setianya untuk membantu mengeluarkan Suta dari penjara. Setelah Suta keluar, mereka berdua melarikan diri lalu menikah dan tinggal di desa terpencil. Dari kisah keduanya, desa yang mereka tinggali bernama Baturaden yang berasal dari Batur yang berarti abdi dan raden yang merupakan keturunan dari seorang adipati."]],
       [1,2, "Rawa Pening", 
          ["Dahulu, di lembah antara Gunung Merbabu dan Telomoyo terdapat sebuah desa bernama Ngasem. Di desa itu tinggal sepasang suami isti bernama Ki Hajar dan Nyai Selakanta. Suatu ketika Nyai Selakanta bersedih karena pernikahan mereka juga belum dikaruniakan seorang anak. Akhirnya, Ki Hajar memutuskan untuk bertapa di goa guna memohon pada Tuhan agar diberi anak.",
           "Ternyata anak tersebut adalah seekor naga yang bisa dan	diberi nama Baru Klinthing. Setelah Baru Klinthing besar, Ki Hajar memerintahkan anaknya untuk bertapa di Bukit Tugur. Sigkat cerita, Baru Klinthing ditangkap oleh warga Desa Pathok, dipotong-potong, dan dimasak sebagai makanan pesta. Ternyata Baru Klinthing menjelma menjadi manusia. ",
           "Baru Klinthing yang merasa lapar meminta makanan pada warga Desa Pathok yang sedang berpesta. Akan tetapi tidak ada yang menghiraukan. Baru Klinthing kemudian menancapkan lidi ke tanah dan menantang warga desa untuk mencabutnya. Tidak ada satu pun warga desa yang dapat mencabut lidi tersebut. ",
           "Dengan kesaktiannya, Baru Klinthing mencabut lidi tersebut lalu keluar lah air yang kemudian menenggelamkan seluruh desa sehingga terbentuklah danau bernama Rawa Pening."]],
       [1,3, "Gunung Merapi", 
          ["Pulau Jawa merupakan sebuah pulau yang luas namun hanya terdiri dari tanah datar saja. Oleh karena itu para dewa ingin memindahkan sebuah gunung yang bernama gunung Jamurdipa ke suatu daerah di pulau Jawa. Di tempat yang nantinya akan menjadi tempat gunung merapi, terdapat dua orang empu yang sangat sakit yang sedang membuat keris sakti. ", 
           "Kedua empu ini didatangi oleh para utusan dewa untuk pindah dari tempat tersebut. Tapi kedua empu itu tidak dapat meninggalkan tempat itu karena tidak sembarang tempat untuk membuat keris sakti. Karena dengan sikap keras tersebut para dewa marah dan memindahkan gunung jamurdipa secara tiba-tiba dan menimbun kedua empu tersebut hingga tewas.",
           " Karena hal itu, gunung jamurdipa yang dulunya bukan gunung yang aktif sekarang memiliki sebuah kawah yang merupakan tempat perapian dalam membuat keris sakti. Dan konon katanya roh kedua empu tersebut menjadi penjaga dari gunung merapi ini. "]],
       [2,1, "Simalungun", 
          ["Dahulu, di wilayah Kampung Nagur, Sumatra Utara, terdapat sebuah kerajaan kecil bernama Kerajaan Tanah Djawo. Kerajaan suku Batak yang bermarga Sinaga ini dipimpin oleh seorang raja yang adil dan bijaksana. Suatu hari, tersiar kabar bahwa Kerajaan Majapahit dari tanah Jawa akan datang menyerang Kerajaan Tanah Djawo. ", 
           "Mendengar kabar tersebut, Raja Tanah Djawo segera meminta bantuan kepada Kerajaan Silou dan Kerajaan Raya. Namun sayangnya, bantuan itu tidak sanggup menangkal dan mengusir pasukan Majapahit. Para warga yang selamat kemudian menetap di Pulau Samosir dalam waktu yang lama, hingga suatu saat mereka memutuskan untuk kembali ke daerah asal mereka (Kampung Nagur). ",
           "Setibanya disana, para warga banyak yang menangis dan mengatakan 'sima-sima nalungun'. Sejak itulah Kampung Nagur berubah nama menjadi Sima-sima Nalungun, yang berarti daerah sunyi sepi. Lama-kelamaan, orang-orang menyebutnya Simalungun."]],
       [2,2, "Danau Toba", 
          ["Dahulu kala di wilayah Sumatera Utara, ada seorang pemuda bernama Toba yang kesehariannya bekerja sebagai petani. Selain bertani, Toba juga senang memancing. Satu hari, ia pergi memancing ke sungai dan merasa kegirangan ketika dirinya mendapat seekor ikan mas berukuran besar yang kemudian dibawanya pulang. ", 
           "Ketika hendak menyalakan api, hendak memasak ikan itu, Toba terkejut karena ikan sudah tidak ada di dalam ember, melainkan koin emas. Singkat cerita, diketahui bahwa ikan mas yang ditangkap Toba merupakan seorang bidadari cantik. Toba lalu menikahi bidadari cantik itu, dan dikaruniai seorang anak laki-laki bernama Samosir. ",
           "Suatu hari, Samosir disuruh ibunya untuk mengantarkan makanan pada Toba. Ditengah jalan, Samosir kelaparan, ia memakan sebagian makanan Toba. Toba terkejut sekali, dan berkata 'Dasar kau anak ikan!' lalu Samosir dipukul oleh Toba. Ia mengadukan kejadian itu pada ibunya. ",
           "Wanita itu sangat marah dan menyuruh Samosir unuk pergi ke puncak sebuah gunung. Tiba tiba, air dari sungai meluap. Air sungai berkumpul dan menjadi Danau. Ikan yang berwujud bidadari pun kembali kesungai. Sementara Toba tak berhasil menyelamatkan diri. Genangan air itu diberi nama Danau Toba, sedangkan daratan tempat Samosir berlindung dinamakan Pulau Samosir. "]]
    ] setget , get_bab

func get_pemain():
	return default_pemain
func get_penghargaan():
	return default_penghargaan
func get_jilid():
	return default_jilid
func get_bab():
	return default_bab

func path4(target: String)->String:
	match target:
		"pemain":
			return "user://userdata.json"
		"penghargaan":
			return "user://achievement.json"
		"jilid":
			return "user://chapter.json"
		"bab":
			return "user://stage.json"
	return "null :("
