CREATE DATABASE  IF NOT EXISTS `sicef` /*!40100 DEFAULT CHARACTER SET utf32 */;
USE `sicef`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: sicef
-- ------------------------------------------------------
-- Server version	5.7.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (10,'Srbija'),(11,'Ekonomija'),(12,'Svet'),(13,'Kultura'),(14,'Fudbal'),(15,'Kosarka'),(16,'Tenis');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `date` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  `summary` text NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (521,'Tadić:Ne otkrivati ime zajedničkog kandidata','2016-11-06 13:14:40',10,' \"To bi Vučić i vlast veoma voleli. Kada bismo odgovarali na pitanje o zajedničkom kandidatu ovoga trenutka, onda bismo učinili veliku uslugu vlasti i niko ne treba da izlazi niti sa vlastitim kandidaturama, niti sa spekulacijama ko bi to mogao biti\", rekao je Tadić. \"Nije sve bilo dobro ni u mom vremenu, kada sam ja bio predsednik, i te kako nije bilo dobro. I ja sam imao ozbiljnih grešaka u svom ponašanju, u nereagovanju na pogrešne stvari pre svega, ali ovo danas je tragikomično\", smatra Tadić.',NULL),(522,'Privrednici pomažu studente: Stipendisti moraju da se vrate u Užice gde ga čeka siguran posao','2016-11-06 13:14:40',10,' Novina je da će se u stipendiranje, pored grada, uključiti i ovdašnji privrednici, kojima treba visokoškolski kadar. U toku je priprema pravilnika koji će biti završen u narednih desetak dana, tako da bi konkurs raspisali krajem novembra.',NULL),(523,'NEMAČKI AMBASADOR ZA \"BLIC\": \"Nema novih uslova za Srbiju, ali...\"','2016-11-06 13:14:40',10,' Upitan da li bi Srbiji dao prelaznu ocenu u Poglavlju 23, nemački ambasador je rekao da je \'ispunjavanjem preduslova za otvaranje poglavlja posao nije završen\'. Šta još nemački ambasador kaže o odnosima Srbije i Rusije, usklađivanju spoljne politike sa EU, o poslednjim bezbednosnim dešavanjima u Srbiji, kao i slučaju Savamala, čitajte u današnjem štampanom izdanju \"Blica\".',NULL),(524,'Drašković: Ruske paraslužbe iza napada na Đukanovića i Vučića','2016-11-06 13:14:40',10,' Drašković, koji za sebe kaže da je preživeo više pokušaja atentata, smatra da iza toga stoje ruske i srpske paraslužbe. \"Smatra da je pokušaj krvoprolića u Crnoj Gori za sada propao. „Mislite da će strukture o kojima govorimo tako lako odustati?! Neće! To zna i Aleksandar Vučić koji je, govoreći o planiranom napadu na Crnu Goru, o tom \'faktoru inostranosti\', bio itekako svestan da se time krvavo zamerio organizatorima planiranog zločina. Sudski proces i ubedljivi dokazi protiv terorista koji su 16. oktobra u Crnoj Gori spremali krvoproliće mogli bi da odigraju ključnu ulogu u smislu otrežnjenja mnogih i u Srbiji i u Crnoj Gori\", uveren je Drašković.',NULL),(525,'Strani agenti u službama ugrozili Vučićev život?!','2016-11-06 13:14:40',10,'Srpske bezbednosne službe napravile su ogroman propust u svojoj osnovnoj funkciji, a to je obezbeđenje premijera Aleksandra Vučića. Tweet Tanjug Nikad nije dobio upozorenje o mogućnosti napada: ...',NULL),(526,'Vučića hoće da ubiju oni koji žele haos u Srbiji!','2016-11-06 13:14:40',10,'\"Sto odsto sam siguran da Amerika ne želi da Vučić ode, upravo suprotno\", kaže bivši ambasador SAD u Srbiji. Iskusnom diplomati koji je prošao sve moguće obuke o tome kako razgovarati sa novinarima, ...',NULL),(527,'Joksimović: Kina Srbiju posmatra kao značajnog partnera','2016-11-06 13:14:40',10,' Dakle, u pitanju su projekat Surčin-Obrenovac, zatim železnička pruga Beograd-Budimpešta koja je u ovom trenutku potpisana na komercijalnom nivou, dakle u pitanju su izuzetno povoljni krediti. Dakle, sve su ovo jasni signali da Kina ne namerava da ovaj projekat drži aktivnim u nekom kratkom vremenskom periodu, već strateški dugotrajno da ulaže u ovo područje, kako bi zapravo i kroz ove infrastrukturne projekte omogućila da strateški veliki projekat \"Put svile\" zaživi u punom kapacitetu - rekla je Jokismovićeva.',NULL),(528,'Štrajkači glađu u Zastava INPRO najavili radikalizaciju protesta','2016-11-06 13:14:40',10,' Oktobra odbijaju hranu, bićemo primorani da radikalizujemo protest, rekao je danas FoNetu predsednik Štrajkačkog odbora Stevan Pušonja. Posledica iscrpljujućeg gladovanja ljude ozbiljno brine i neizvesna sudbina njih i njihovih porodica ukoliko ostanu bez posla.',NULL),(529,'Vučić: Hoću dvostruko više kilometara autoputeva nego u vreme Tita','2016-11-06 13:14:40',11,' \"Sutra otvaramo deonicu Ljig-Preljina, dužine 40,4 kilometara a onda ostaju Obrenovac-Ub i treći deo deonice Lajkovac-Ljig gde imamo problem sa eksproprijacijom. Za nas je prioritetno da sa njima uskoro dogovoramo deonicu Požega-Preljina, u dužini od 31 kilometar, čijim bi završetkom dramatično povećali turistički potencijal Zapadne Srbije\", kazao je premijer. Kineska kompanija CCCC pružiće svu pomoć Vladi Srbije u realizaciji velikih infrastrukturnih projekta, kao i da se nađe način da se u najskorijem roku završi autoput koji povezuje Beograd sa lukom Bar u Crnoj Gori.',NULL),(530,'Vučić: Nastaviću da molim, a oni se nađu u čudu','2016-11-06 13:14:40',11,' \"Ja sam danas kineskog premijera Li Keanga molio za RTB Bor i nastaviu da molim. Moj posao je da tamo gde ne moemo biznisom da privuemo nekoga, da iskoristimo svoju politiku poziciju koja je dobra i zamolimo nae prijatelje da nam pomognu\", kazao je Vui za Televiziju Pink. On je dodao i da se Li Keang nae u udu kada uje ta su molbe i zahtevi, naglaavajui da e nastaviti da moli za RTB Bor, uz zahvalnost Kinezima za elezaru Smederevo.',NULL),(531,'Može li kosovski zakon o „Trepči” biti zaboravljen','2016-11-06 13:14:40',11,' „Posle toga bi trebalo da se jednom zauvek prekine sa praksom da se o pitanjima koja su od vitalnog značaja za srpski narod na Kosovu odlučuje bez učešća političkih predstavnika Srba jer bez naše saglasnosti teme poput Trepče ne mogu biti rešavane na pravedan i održiv način\", kaže Simić i dodaje da će akcionari i poverioci „Trepče\" pokrenuti sudske postupke protiv kosovske vlade. Ambasador Davenport sa saradnicima primio je pismo i zahvalio na ukazanim činjenicama o imovinskoj strukturi „Trepče\", kao i iznetim argumentima o nelegalnoj odluci kosovske skupštine kojom je ta imovina, uz kršenje osnovnih principa vladavine prava, konfiskovana.',NULL),(532,'Poslednje pripreme uz šale i narodnjake','2016-11-06 13:14:40',11,' Imamo dozvolu od „Koridora\" - objasnili smo pripadnicima MUP-a koji, kako su se obavljale poslednje pripreme, nikome osim nadležnih službi i građevinara, juče nisu dozvoljavali ulazak na auto-put. \"- Će vam kažemo, ali samo ako ćete da pričamo vranjski - našalio se jedan od radnika koji je sa kolegama poslednje radove proslavljao uz „narodnjake\".',NULL),(533,'Evro sutra 123,02 dinara','2016-11-06 13:14:40',11,' Dinar će u ponedeljak prema evru biti jači za 0,1 odsto nego pre mesec dana, a na godišnjem nivou će biti slabiji za 2,0 odsto. Indikativni kurs dinara prema dolaru je danas ojačao za 0,2 odsto na 110,65 dinara za jedan dolar.',NULL),(534,'Raspad države ih odveo u stečaj','2016-11-06 13:14:40',11,' Prema informacijama kojima raspolažemo reciprocitet u primeni Aneksa G nije uspostavljen sa Hrvatskom - rečeno je \"Novostima\" u Ministarstvu privrede. Kada je u pitanju Slovenija, ona je stavila van snage propise kojima je imovina srpskih preduzeća blokirana.',NULL),(535,'U čijim su rukama zaostale plate radnika?','2016-11-06 13:14:40',11,' Ni - Operativna grupa koju je Ministarstvo privrede formiralo kako bi bio reen problem zaostalih plata radnika propalih drutvenih firmi ponovo je boravila u Niu. Nekadanji radnici Manske i Elektronske industrije, Jastrepca, Graevinara i drugih firmi su prilikom boravka Vlade Srbije u Niu dobli obeanje ministra privrede Gorana Kneevia da e Operativna grupa utvrditi konane spiskove zaposlenih koji potrauju zaostale plate, dok bi isplata trebalo da krene krajem godine.',NULL),(536,'Napori ECB još ne deluju, aktivnost nije snažna','2016-11-06 13:14:40',11,' Naime, indeks menadera nabavke za evrozonu je u oktobru iznosio 53,3 poena, to je nie u odnosu na preliminarnu procenu od 53,7 poena, ali je iznad 52,6 poena iz septembra i najvii nivo od januara, saoptila je kompanija Markit, a prenosi agencija Rojters. Svaki podatak iznad 50 poena ukazuje na jaanje sektorske aktivnosti, a ispod 50 poena na njeno slabljenje.',NULL),(537,'Nemci ne pamte ovakav raj za život','2016-11-06 13:14:40',11,' Prema podacima federalne agencije za zapoljavanje, broj nezaposlenih lica je prolog meseca pao za 68.000 u odnosu na septembar, na 2,54 miliona, dok je stopa nezaposlenosti iznosila 6,0 odsto, to je najnii nivo od ujedinjenja Istone i Zapadne Nemake 1990. \"U skladu sa jesenjim oporavkom, stopa nezaposlenosti je znaajno pala, dok je zapoljavanje ponovo poraslo, a potranja za radnicima takoe belei rast\", izjavio je ef agencije za zapoljavanje, Frank Vajs.',NULL),(538,'PADA PRESTONICA KALIFATA Počela operacija za oslobađanje Rake','2016-11-06 13:14:40',12,' \"Velika bitka za oslobađanje Rake i njegove provincije je počela\", rekla je portparolka Sirijskih demokratskih snaga na konferenciji za novinare u mestu Ain Isa, 50 kilometara severno od Rake - koja je u rukama Islamske države dve i po godine. Sirijskim demokratskim snagama dominiraju glavne sirijske kurdske borbene jedinice, poznate kao Jedinice za zaštitu kurdskog naroda ili YPG. SAD smatra sirijske kurdske borce najefikasnijom snagom protiv Islamske države, međutim, Turska ih smatra terorističkom organizacijom a saopštila je ranije da neće prihvatiti ulogu Kurda u oslobađanju Rake, prenosi agencija AP..',NULL),(539,'\"Vlada da zaštiti srpskog dečaka koga je silovao migrant\"','2016-11-06 13:14:40',12,' Predsednik SNP Nenad Popovi pozvao je Vladu Srbije da zatiti integritet srpskog deaka koga je u Austriji silovao migrant. \"Odluka Vieg suda u Austriji da poniti presudu migrantu koji je silovao deaka srpskog porekla u Beu, opravdava nasilje, razvrat i pedofiliju i afirmie ih kao nove zajednike vrednosti Evropske unije. Da li Srbija zaista treba da ide u takvu Evropsku uniju gde bez kazne prolaze oni koji siluju decu\", navodi Popovi u saoptenju.',NULL),(540,'Tramp kreće na demokratska uporišta','2016-11-06 13:14:40',12,' Tramp je već krenuo na put za Nevadu i Kolorado, države u kojima ankete nedeljama daju prednost demokratskoj kandidatkinji Hilari Klinton, ali se ta razlika smanjuje u vreme kada raste Trampov rejting na nacionalnom nivou, navodi AP. Klinton vodi sa pet poena ispred republikanskog kandidata pokazuje najnovija zajednička anketa \"Vašington posta\" i TV stanice Ej-Bi-Si. Prema anketi za Klinton je 48 odsto anketiranih u poredjenju sa 43 procenta Trampovih glasača. Idemo u Minesotu koja tradicionalno uopšte nije republikanska - rekao je Tramp na mitingu u Tampi, u Floridi.',NULL),(541,'Kurdski militanti preuzeli odgovornost za napad u Dijarbakiru','2016-11-06 13:14:40',12,' Eksplozija u Dijarbakiru odjeknula je samo nekoliko časova, nakon što je policija uhapsila lidera i poslanike Narodne demokratske partije, najveće kurdske stranke u regionu. U poslednjih nekoliko godina, u Turskoj je izvršeno mnogo napada na civile koje su organizovali Kurdski militanti, radikalni islamisti i ultra-levičari.',NULL),(542,'BRITANCI PRIZNALI Ruska \"Armata\" je revolucionaran tenk, ništa bolje nije napravljeno poslednjih 50 GODINA','2016-11-06 13:14:40',12,' Poseduje kameru visoke rezolucije, kao i najsofistiraniju radarsku tehnologiju, kao i skrivene senzore koji detektuju skrivene protivtenkovske mine. Proizveden je u okviru 350 milijardi evra vredne obnove ruskog naoružanja i u stanju je da postane potpuno automatizovan, što ga čini prvim kompletno robotizovanim tenkom na svetu.',NULL),(543,'Dvoje uhapšenih kod istanbulskog aerodroma','2016-11-06 13:14:40',12,' Turska državna agencija Anadolija saopštila je da je policija izvela kontrolisanu eksploziju torbe na motociklu osumnjičenih posle čega je ponovo uspostavljen redovan saobraćaj kod aerodroma. Turska aviokompanija \"Turkiš erlajns\" je u tviter poruci navela da su odlasci sa aerodroma \"Ataturk\" odvijaju na vreme.',NULL),(544,'Eksplozija gasa u Rusiji, šestoro mrtvih','2016-11-06 13:14:40',12,'Šestoro ljudi je poginulo, a četvoro u kritičnom stanju posle eksplozije gasa u stambenoj zgradi u Ivanovu, mestu oko 250 kilometara severno od Moskve, javile su ruske službe za vanredne ...',NULL),(545,'Tramp sklonjen s bine zbog lažne uzbune','2016-11-06 13:14:40',12,' \"RINO - Republikanskog kandidata za predsednika SAD Donalda Trampa obezbeđenje je privremeno sklonilo sa bine tokom predizbornog skupa u Navadi zbog lažne uzbune, do koje je došlo kada je neko u masi uzviknuo „pištolj\", posle čega je jedna osoba zadržana u pritvoru. Nikada nas neće zaustaviti\", rekao je Tramp nakon što se vratio na binu.',NULL),(546,'Kurc: Zatvoriti granice umesto sporazuma sa Turskom','2016-11-06 13:14:40',12,'Ministar inostranih poslova Austrije Sebastijan Kurc oštro je krikritikovao Ankaru, poručivši da ne želi da se oslanja na sporazum EU i Turske o izbeglicama, već da je neophodno konačno bolje ...',NULL),(547,'VICE na TV B92: Ko je Melanija Tramp?','2016-11-06 13:14:40',12,' TV B92. Oduvek se zvala Melanija, ali prezime je menjala tri puta sve dok nije postala gospoa Tramp i potencijalna prva dama Amerike. Rezultat toga je veliki broj mentalnih bolesnika koji esto izvravaju manja krivina dela zbog ega zavravaju u zatvoru.',NULL),(548,'Ilić, Sun i Vepreva dobili nagrade Oktobarca','2016-11-06 13:14:40',13,' Odluku o toj nagradi doneli su kustoskinja Likovne galerije Kulturnog centra Beograda Gordana Dobrić, koordinatorka Oktobarskog salona Zorana đaković i direktorka Savremene galerije Subotica Nela Tonković. Dodeljivanjem dve nagrade žiri je podsetio na dve tačke sagledavanja ovogodišnje teme Salona koju je postavio britanski kustos Dejvid Eliot i akcentovao \"Mogućnost postojanja dva pola, nipošto suprotstavljena, tretitanja tako osetljive teme\", dodaje se u saopštenju.',NULL),(549,'REGIONALNI SEMINAR POLITIKOLOGA NA KOPAONIKU: Izbori u SAD od planetarne važnosti','2016-11-06 13:14:40',13,'KOPAONIK - Američki ambasador u Srbiji Kajl Skat i dekan Fakulteta političkih nauka Univerziteta u Beogradu (FPN) Dragan Simić složili su se večeras na otvaranju Desetog regionalnog seminara ...',NULL),(550,'Kosovo: Sedmoro uhapšeno zbog protivustavnog delovanja','2016-11-06 13:14:40',13,' Nakon akcije kosovske policije u Prištini, Kosovskoj Mitrovici, Uroševcu, uhapšeno sedam osoba osumnjičenih za terorizam i za \"Protivustavno delovanje i ugrožavanje bezbednosti na Kosovu\". Akcija polcije je izvedena u Prištini, Kosovskoj Mitrovici, Uroševcu, navodi se u saopštenju policije.',NULL),(551,'ISTINA O VLADICI NIKOLAJU Možda nije bio bezgrešan, ali isti kao Stepinac sigurno nije','2016-11-06 13:14:40',13,'Vladika Nikolaj Velimirović nije bio bezgrešan, ali je nedopustivo njegovo poređenje sa Alojzijem Stepincem. Foto: Wikipedia Nikolaj Velimirović Ovo za “Blic” tvrde srpski istoričari povodom tvrdnji ...',NULL),(552,'Lideri Kipra od ponedjeljka pregovaraju o ujedinjenju','2016-11-06 13:14:40',13,'Lideri kiparskih Grka i Turaka u ponedjeljak će u Švajcarskoj pod okriljem UN nastaviti pregovore u cilju ponovnog ujedinjena ostrva pod ijeljenog 42 godine.',NULL),(553,'Bandić za referendum o preimenovanju Trga maršala Tita','2016-11-06 13:14:40',13,' ZAGREB - Zagrebački gradonačelnik Milan Bandić rekao je danas da odluku o eventualnom preimenovanju Trga maršala Tita u Kazališni trg treba doneti na referendumu, koji bi bio održan 21. Da u istom trošku napravimo taj test i da građani grada Zagreba odluče da li su za ostanak Trga maršala Tita, ili su za to da taj Trg se vrati na svoj stari naziv, a to je Kazališni trg.',NULL),(554,'U dva napada u Iraku 20 mrtvih','2016-11-06 13:14:40',13,'Najmanje 20 ljudi poginulo je danas u dva samoubilačka napada u iračkoj provinciji Salahudin, izjavili su zvaničnici. Najmanje 11 ljudi je poginulo u samoubilačkom napadu na hodočasnike u gradu ...',NULL),(555,'Napoli nudi 20 miliona za Mitrovića','2016-11-06 13:14:40',14,' Mitrović ove sezone u drugoj ligi Engleske nije standardan, ali je postigao pet golova na sedam utakmica u svim takmičenjima. Napolitanci pokušavaju to da iskoriste, pogotovo što nude dva miliona više nego što je svojevremeno Njukasl platio Anderlehtu za prelazak Mitrovića.',NULL),(556,'Gajić: Zabranio sam komentarisanje suđenja','2016-11-06 13:14:40',14,' \"To što po mnogima igramo najlepši fudbal ne znači automatski da ćemo biti prvaci, ali se trudimo da atraktivnom igrom privučemo gledaoce na tribine. Naravno, svako ko se takmiči u bilo čemu želi da pobedi tako i mi želimo trofeje i oni će vremenom doći siguran sam u to, ako ne ove godine ono naredne ili neke od narednih\", rekao je on. Ono što je novost u funkcionisanju nekog fudbalskog kluba u Srbiji, a što je Vojvodina u poslednja dva meseca počela da praktikuje, je organizovanje susreta privrednika koji su okupljeni oko FK Vojvdina, sa privrednicima iz gradova u kojima novosadski superligaš gostuje, kao što su Niš, Novi Pazar, Kruševac, Bačka Palanka, Subotica.... \"To je naka moja lična vizija da kroz fudbal pokrenemo i druge sfere društva. Fudbal je jedno poluvreme, a drugo poluvreme je povezivanje gradova, privrede, ljudi, jer mislim da nam je to kao društvu neohodno\", rekao je Gajić i dodao da takve inicijative i priliče Vojvodini jer je ona \"Stara dama srpskog fudbala\".',NULL),(557,'Čovek koji Zvezdu održava na vrhu - Predrag Sikimić!','2016-11-06 13:14:40',14,'Zahvaljujući njegovim golovima, Crvena zvezda u ovom trenutku ima čak devet bodova više od Partizana... Ma koliko ga neki osporavali, Predrag Sikimić se prosto razgoropadio u poslednje vreme, i to od ...',NULL),(558,'CECA KAO MOTIV: Trener Napretka obećao fudbalerima odlazak na koncert, a posle pobede desilo se OVO','2016-11-06 13:14:40',14,' Pobeda nad Bačkom od 3:1 fudbalerima Napretka donela je usmene čestitke od trenera Dragana Ivanovića, ali ne i odlazak na koncert Cece Ražnatović 12. OduševljenaCECA: VELIKA ČAST ZA MENE. Cecu je obradovala informacija da su fudbaleri Napretka imali njen koncert kao glavni motiv za pobedu u superligaškom meču:- Stvarno su imali takvo obećanje? Divno! Za mene je velika čast što je neko želeo da slavi pobedu uz moje pesme.',NULL),(559,'Falkao: Poziv u reprezentaciju Kolumbije je poseban trenutak za mene','2016-11-06 13:14:40',14,' Radamel Falkao ponovo e igrati za reprezentaciju Kolumbije, prvi put posle 388 dana. Tridesetogodinji fudbaler podsetio je dane kada je bio u ibotnoj formi, postigao je est golova na osam meeva ove sezone, au sredu je postigao dva u pobedi Monaka nad CSKA u etvrtom kolu Lige ampiona, to su mu prvi pogoci u elitnom takmienju posle est i po godina.',NULL),(560,'VIDEO: Čelsi igra \"tika-taka\" kao Barsa','2016-11-06 13:14:40',14,' Minutu Dijego Kosta je dodao do Edena Azara, ovaj uneo u kazneni prostor i preciznim udarcem pogodio dalji ugao gola koji brani Stekelenburg. Ovaj je iz prve gaao suprotni ugao, golman je kratko odbio loptu, ali je ona pala na nogu Pedru koji je lagano prosleuje u praznu mreu.',NULL),(561,'Partizan dočekuje Novi Pazar','2016-11-06 13:14:40',14,'Preostala dva duela 15. kola igraju se danas. Javor će od 13.30 dočekati niški Radnički, dok od 17.00 na stadionu u Humskoj igraju Partizan i Novi ...',NULL),(562,'Ivanović od januara \"čekićar\"','2016-11-06 13:14:40',14,'Branislav Ivanović bi mogao u januaru da napusti Česli, javljaju britanski mediji. Tweet pixabay.com Tekst potpisa Kapiten reprezentacije Srbije je u drugom planu kod novog trenera Antonija Kontea i ...',NULL),(563,'Klivlend jedva, Klipersi deklasirali Sparse','2016-11-06 13:14:40',15,' Klivlend je ubedljivo dobio prvu etvrtinu sa 34:19 i malo je falilo da ispusti prednost, ali ih je odravao Lebron Dejms, koji je ubacio 25 poena, uz 14 asistencija i 8 skokova. U ekipi iz Vaingtona je prednjaio Markif Moris sa 18 poena, Bredli Bil je ubacio 15, dok je Oto Porter imao 10 poena i 13 skokova.',NULL),(564,'Simonović za \"Blic\": U derbiju će prštati, neka se Partizan spremi','2016-11-06 13:14:40',15,' \"Trijumf protiv crno-belih bi zalečio evroligaške rane! Košarkaši Crvene zvezde će nakon dva uzastopna poraza u elitnom takmičenju od Panatinaikosa i Baskonije pokušati da se iskupe sutra, i to na meču protiv večitog rivala Partizana. Jedan od najboljih u redovima crveno-belih ove sezone Marko Simonović nema dilemu da bi pobeda nad najljućim protivnikom donekle ublažila gorak ukus poraza u Evropi.\"- Baskonija je zasluženo pobedila. Oni imaju bolje uslove za pripremu, više vremena za odmor, ali mi nikad nismo odustajali, pa nećemo ni sada - kaže Simonović za „Blic\".',NULL),(565,'Milojević posle drame sa Krkom: Previše grešaka! Ovako ne može da se igra ozbiljna košarka, niti da se pobedi!','2016-11-06 13:14:40',15,' Domain je loe uao u me, posle uvodnih deset minuta gubio je sa devet poena razlike, da bi sjajnom igrom u drugoj etvrtini stigao do est poena prednosti. Meutim, gostima su posle povratka sa odmora dozvolili da ubace ak 32 poena, pa je Krka imala minimalnu prednost pred odluujuu deonicu.',NULL),(566,'SRPSKI REP HIT U AMERICI: Boban Marjanović zarazio saigrače pesmom Keš, kolica!','2016-11-06 13:14:40',15,'Srpski centar Boban Marjanović iako nema veliku minutažu na startu sezone u novom klubu Detroitu, uvek je u centru pažnje javnosti. Ovog puta popularni Bobi je dospeo u žižu javnosti zbog srpskog ...',NULL),(567,'ODLIČAN, PET Marina Maljković ruši sve redom sa Galatasarajem','2016-11-06 13:14:40',15,'Košarkašice Galatasaraja nastavljaju sa briljantnim partijama pod vođstvom naše Marine Maljković. Slavni istanbulski tim zadržao je maksimalan učinak na zvaničnim utakmicama ove sezone i zabeležio ...',NULL),(568,'Jokić šest, Marjanović dva, Bjelica bez poena','2016-11-06 13:14:40',15,' Marjanović je pogodio jedan od dva šuta i upisao dva poena, dok je Jokić za 22 minuta upisao po šest poena i skokova. Na terenu je minule noći bio i Nemanja Bjelica, u porazu Minesote na gostovanju Oklahomi 112:92, ali se za 10 minuta nije upisao u strelce - šutirao je samo dva puta za tri.',NULL),(569,'NBA Top 10 - Let \"grčkog čudovišta\" potez večeri','2016-11-06 13:14:40',15,'Zakucavanja su i sinoć bia u prvom planu, najmonstrouznije je izveo \'Greek Freak\'. Osim pobednika Janisa Adetokunba , koji je pobedio i samog sebe, na listi su se našli još Andre Dramond , Džabari ...',NULL),(570,'PRIJATELJU, SVAKA ČAST Ovako je Nadal čestitao Endiju na uspehu','2016-11-06 13:14:40',16,'Ne prestaju da stižu čestitke na adresu Endija Mareja. Škot će od ponedeljka i zvanično biti prvi na svetu, a na tom uspehu čestitali su mu i njegovi drugovi sa Tura.',NULL),(571,'TI SI NAŠA INSPIRACIJA Ovako je svet tenisa reagovao na proboj Mareja na prvo mesto','2016-11-06 13:14:40',16,' Britanski teniser je najpre dočekao da Novak Đoković ne odbrani parisku titulu, jer je na tamošnjem mastersu srpski igrač poražen od Marina Čilića u četvrtfinalu, posle čega je Mareju trebao plasman u finale da bi potvrdio proboj na lidersku poziciju. To se i obistinilo kada mu je Miloš Raonić u subotu bez borbe predao polufinale, zbog povrede, pa će Endi na prvo mesto bez obzira na ishod finala u kome mu je rival Džon Izner.',NULL),(572,'Mari: Bilo je preteško stići Novaka','2016-11-06 13:14:40',16,' Novi prvi teniser sveta Endi Mari rekao je da mu mnogo znai to je uspeo da skine Novaka okovia sa ATP trona. \"„okovi je posle Rolan Garosa imao 7.000 bodova vie od mene, a kao to sam rekao, cilj mi na poetku sezone nije bilo prvo mesto, nisam o tome razmiljao.',NULL),(573,'Izner preko Čilića do finala Pariza','2016-11-06 13:14:40',16,' Ameriki teniser Don Izner plasirao se u finale Mastersa u Parizu pobedom nad Marinom iliem 6:4, 6:3. Izner je imao odlian me u kom je u potpunosti nadigrao hravtskog tenisera, koji je delovao istroeno posle pobede nad Novakom okoviem u petak.',NULL),(574,'Raonić: Pokidan mi je butni mišić','2016-11-06 13:14:40',16,' Kanadski teniser Milo Raoni rekao je da je predao me Endiju Mariju jer mu je pokidan butni mii. \"Jutros sam imao problema sa buenjem i bilo mi je teko da ustanem iz kreveta. Uradio sam neke testove, ali i magnetnu rezonancu. Nali su da mi je pokidan desni butni mii. Naalost, nisam bio u stanju da igram protiv Endija\", rekao je Raoni u Parizu.',NULL),(575,'Selektor Srbije: Zbunjuje me Đokovićeva dijeta','2016-11-06 13:14:40',16,'Šta se događa sa Novakom Đokovićem poslednjim meseci velika je misterija. Mnogi u rigoroznoj ishrani, netipičnoj za profesionalne sportiste, vide glavni problem pada našeg asa.',NULL),(576,'Meditacija za Novaka','2016-11-06 13:14:40',16,'Danas je poslednji dan 122. uzastopne sedmice koliko je Đoković proveo na ATP listi Endi Mari će od ponedeljka zasesti na prvo mesto ATP liste i za to mu svaka čast. Da je zaslužio, zaslužio je.',NULL),(577,'FOTO: Ovi teniseri su bili broj 1!','2016-11-06 13:14:40',16,'Škot Endi Marej je 26. teniser koji je postao broj 1 na ATP listi. Posle 122 nedelje na tronu, Novak Đoković je prepustio vršnjaku presto posle poraza našeg asa od Marina Čilića u četvrtfinalu ...',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_keywords`
--

DROP TABLE IF EXISTS `news_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(45) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_keywords`
--

LOCK TABLES `news_keywords` WRITE;
/*!40000 ALTER TABLE `news_keywords` DISABLE KEYS */;
INSERT INTO `news_keywords` VALUES (153,'lokalu',521),(154,'fakulteta',522),(155,'Novembra',522),(156,'Ditman',523),(157,'Srbije',523),(158,'Srbiji',523),(159,'Dra&scaron;kovi',524),(160,'Crnoj',524),(161,'projekat',527),(162,'okviru',527),(163,'Dakle',527),(164,'Pu&scaron;onja',528),(165,'Ukoliko',528),(166,'rekao',528),(167,'Beograda',529),(168,'deonicu',529),(169,'Srbije',529),(170,'Premijer',530),(171,'kosovske',531),(172,'auto-put',532),(173,'odsto',533),(174,'prema',533),(175,'Dinar',533),(176,'imovina',534),(177,'Aneksa',534),(178,'firmi',535),(179,'Operativna',535),(180,'grupa',535),(181,'radnici',535),(182,'poena',536),(183,'Markit',536),(184,'oktobru',536),(185,'nezaposlenosti',537),(186,'agencije',537),(187,'Stopa',537),(188,'zapoljavanje',537),(189,'snaga',538),(190,'Islamske',538),(191,'demokratskih',538),(192,'Popovi',539),(193,'deaka',539),(194,'Austriji',539),(195,'presudu',539),(196,'Klinton',540),(197,'Tramp',540),(198,'ispred',540),(199,'nekoliko',541),(200,'odbrane',542),(201,'Armata',542),(202,'Turska',543),(203,'aerodroma',543),(204,'Ataturk',543),(205,'vi&scaron;e',543),(206,'nakon',545),(207,'Trampa',545),(208,'do&scaron;lo',545),(209,'skupa',545),(210,'Tramp',547),(211,'Melanija',547),(212,'galerije',548),(213,'salona',548),(214,'Beograda',548),(215,'policije',550),(216,'kosovske',550),(217,'Pri&scaron;tini',550),(218,'Kosovskoj',550),(219,'mar&scaron;ala',553),(220,'Mitrovi',555),(221,'rekao',556),(222,'Vojvodina',556),(223,'Napretka',558),(224,'stvarno',558),(225,'Falkao',559),(226,'posle',559),(227,'ponovo',559),(228,'pogodio',560),(229,'kazneni',560),(230,'poena',563),(231,'asistencija',563),(232,'skokova',563),(233,'protiv',564),(234,'utakmica',564),(235,'vi&scaron;e',564),(236,'poena',565),(237,'upisao',568),(238,'poena',568),(239,'minuta',568),(240,'estitke',571),(241,'sporta',571),(242,'mnogo',572),(243,'Izner',573),(244,'Mastersa',573),(245,'finale',573),(246,'teniser',574),(247,'Raoni',574),(248,'pokidan',574),(249,'rekao',574);
/*!40000 ALTER TABLE `news_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_links`
--

DROP TABLE IF EXISTS `news_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `link` varchar(360) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1564 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_links`
--

LOCK TABLES `news_links` WRITE;
/*!40000 ALTER TABLE `news_links` DISABLE KEYS */;
INSERT INTO `news_links` VALUES (1433,7,521,'http://www.rts.rs/page/stories/sr/story/9/politika/2516480/tadicotkrivanje-imena-zajednickog-kandidata-usluga-vlasti.html'),(1434,3,521,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=06&nav_category=11&nav_id=1196343'),(1435,2,522,'http://www.blic.rs/vesti/srbija/privrednici-pomazu-studente-stipendisti-moraju-da-se-vrate-u-uzice-gde-ga-ceka/ys443s3'),(1436,2,522,'http://www.blic.rs/vesti/drustvo/stipendije-za-najbolje-fondacija-evro-za-znanje-dodelila-13-stipendija-ucenicima-i/9g7y8l5'),(1437,2,522,'http://www.blic.rs/vesti/drustvo/mlade-nade-dodeljene-stipendije-najboljim-dacima-i-studentima/1hf0j88'),(1438,2,522,'http://www.blic.rs/vesti/republika-srpska/na-godisnjem-nivou-22000-km-francuska-nudi-nove-stipendije-studentima-iz-bih/s3yjqdr'),(1439,2,523,'http://www.blic.rs/vesti/politika/nemacki-ambasador-za-blic-nema-novih-uslova-za-srbiju-ali/674b881'),(1440,7,523,'http://www.rts.rs/page/stories/sr/story/9/politika/2516365/ditman-nema-novih-uslova-za-srbiju.html'),(1441,5,524,'http://www.politika.rs/sr/clanak/367268/Draskovic-Ruske-parasluzbe-iza-napada-na-Dukanovica-i-Vucica'),(1442,7,524,'http://www.rts.rs/page/stories/sr/story/9/politika/2516471/draskovic-djukanovic-i-vucic-mete-istog-atentatora.html'),(1443,3,524,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=06&nav_category=11&nav_id=1196332'),(1444,1,525,'http://www.alo.rs/toma-zeli-svoje-ljude-u-vba/79855'),(1445,1,525,'http://www.alo.rs/strani-agenti-u-sluzbama-ugrozili-vucicev-zivot/80001'),(1446,3,525,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=05&nav_category=11&nav_id=1196094'),(1447,1,526,'http://www.alo.rs/vucica-hoce-da-ubiju-oni-koji-zele-haos-u-srbiji/80019'),(1448,3,526,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=04&nav_category=11&nav_id=1195965'),(1449,2,526,'http://www.blic.rs/vesti/politika/montgomeri-marinac-koji-je-vredao-vucica-zasluzuje-da-se-vrati-u-sad/3svwshx'),(1450,2,527,'http://www.blic.rs/vesti/politika/joksimovic-kina-srbiju-posmatra-kao-znacajnog-partnera/eq4e8xf'),(1451,7,527,'http://www.rts.rs/page/stories/sr/story/9/politika/2516446/joksimovic-kina-srbiju-posmatra-kao-znacajnog-partnera.html'),(1452,8,528,'http://www.danas.rs/drustvo.55.html?news_id=331595&title=Najava+radikalizacije+%c5%a1trajka'),(1453,2,529,'http://www.blic.rs/vesti/politika/vucic-hocu-dvostruko-vise-kilometara-autoputeva-nego-u-vreme-tita/feeffsr'),(1454,7,529,'http://www.rts.rs/page/stories/sr/story/9/politika/2516370/vucic-i-sobotka-o-jacanju-ekonomske-saradnje.html'),(1455,2,529,'http://www.blic.rs/vesti/politika/zavrsava-se-samit-kina-plus-16-u-rigi/hyb8097'),(1456,2,529,'http://www.blic.rs/vesti/politika/vucic-i-sobotka-o-jacanju-ekonomske-saradnje/sbdrp15'),(1457,3,530,'http://www.b92.net/biz/vesti/svet.php?yyyy=2016&mm=11&dd=06&nav_id=1196304'),(1458,5,530,'http://www.politika.rs/sr/clanak/367214/Kineske-finansijske-injekcije-za-spas-srpske-privrede'),(1459,3,530,'http://www.b92.net/biz/vesti/srbija.php?yyyy=2016&mm=11&dd=04&nav_id=1195814'),(1460,5,531,'http://www.politika.rs/sr/clanak/367210/Moze-li-kosovski-zakon-o-Trepci-biti-zaboravljen'),(1461,6,531,'http://www.novosti.rs/vesti/naslovna/politika/aktuelno.289.html:633529-Pristina-firmama-duguje-300-miliona-'),(1462,2,531,'http://www.blic.rs/vesti/politika/poverioci-trepce-potrazuju-oko-300-miliona-evra/9ggerh6'),(1463,5,532,'http://www.politika.rs/sr/clanak/367215/Poslednje-pripreme-uz-sale-i-narodnjake'),(1464,9,532,'http://www.kurir.rs/vesti/biznis/svecanost-na-koridoru-11-vucic-u-ponedeljak-otvara-auto-put-ljig-preljina-clanak-2526157'),(1465,7,532,'http://www.rts.rs/page/stories/sr/story/13/ekonomija/2515406/veliki-znacaj-prve-deonice-koridora-11.html'),(1466,7,532,'http://www.rts.rs/page/stories/sr/story/125/drustvo/2515255/vucic-na-otvaranju-auto-puta-ljig-preljina.html'),(1467,2,533,'http://www.blic.rs/vesti/ekonomija/nbs-kupila-30-miliona-evra-kurs-u-ponedeljak-12302/bqxpz8r'),(1468,6,534,'http://www.novosti.rs/vesti/naslovna/ekonomija/aktuelno.239.html:633506-Raspad-drzave-ih-odveo-u-stecaj'),(1469,3,534,'http://www.b92.net/biz/vesti/srbija.php?yyyy=2016&mm=11&dd=06&nav_id=1196318'),(1470,3,535,'http://www.b92.net/biz/vesti/srbija.php?yyyy=2016&mm=11&dd=06&nav_id=1196330'),(1471,3,536,'http://www.b92.net/biz/vesti/svet.php?yyyy=2016&mm=11&dd=06&nav_id=1196333'),(1472,3,537,'http://www.b92.net/biz/vesti/svet.php?yyyy=2016&mm=11&dd=06&nav_id=1196335'),(1473,8,537,'http://www.danas.rs/svet.1160.html?news_id=331510&title=Pada+stopa+nezaposlenosti+u+Hrvatskoj'),(1474,2,538,'http://www.blic.rs/vesti/svet/pada-prestonica-kalifata-pocela-operacija-za-oslobadanje-rake/0fljwfx'),(1475,7,538,'http://www.rts.rs/page/stories/sr/story/10/svet/2516501/sirija-krece-ofanziva-na-raku.html'),(1476,9,538,'http://www.kurir.rs/planeta/pocinje-najveca-bitka-do-sada-30000-kurda-jurisa-na-raku-clanak-2528165'),(1477,9,538,'http://www.kurir.rs/planeta/pocinje-najveca-bitka-do-sada-30000-boraca-spremno-za-juris-na-raku-clanak-2528165'),(1478,3,539,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=06&nav_category=11&nav_id=1196317'),(1479,5,539,'http://www.politika.rs/sr/clanak/367209/Na-Balkanu-73-000-izbeglica-ukopano-u-mestu'),(1480,7,539,'http://www.rts.rs/page/stories/sr/story/9/politika/2516430/popovic-vlada-treba-da-zastiti-silovanog-srpskog-decaka.html'),(1481,2,540,'http://www.blic.rs/vesti/svet/tramp-krece-na-demokratska-uporista/6efgdk1'),(1482,7,540,'http://www.rts.rs/page/stories/sr/story/10/svet/2516326/americki-izbori-balkan-ima-svog-favorita.html'),(1483,2,541,'http://www.blic.rs/vesti/svet/kurdski-militanti-preuzeli-odgovornost-za-napad-u-dijarbakiru/herj7mf'),(1484,3,541,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=06&nav_category=78&nav_id=1196325'),(1485,2,541,'http://www.blic.rs/vesti/svet/turska-racije-na-pripadnike-pkk-uhapseno-15-osoba/r13hl56'),(1486,7,541,'http://www.rts.rs/page/stories/sr/story/10/svet/2516085/protesti-kurda-u-vise-gradova-evrope.html'),(1487,2,542,'http://www.blic.rs/vesti/svet/britanci-priznali-ruska-armata-je-revolucionaran-tenk-nista-bolje-nije-napravljeno/p71y9vl'),(1488,3,542,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=06&nav_category=78&nav_id=1196316'),(1489,7,542,'http://www.rts.rs/page/magazine/sr/story/511/zanimljivosti/2516426/najveci-proboj-u-konstrukciji-tenkova-u-poslednjih-50-godina.html'),(1490,7,543,'http://www.rts.rs/page/stories/sr/story/10/svet/2516435/dvoje-uhapsenih-kod-istanbulskog-aerodroma-.html'),(1491,1,543,'http://www.alo.rs/pucnjava-ispred-aerodroma-grad-blokiran/80053'),(1492,2,543,'http://www.blic.rs/vesti/svet/incident-kod-aerodroma-u-istanbulu-policija-pucala-na-dvojicu-muskaraca/gnv0d7w'),(1493,7,544,'http://www.rts.rs/page/stories/sr/story/10/svet/2516451/eksplozija-gasa-u-rusiji-sestoro-mrtvih.html'),(1494,3,544,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=06&nav_category=78&nav_id=1196334'),(1495,2,544,'http://www.blic.rs/vesti/svet/u-eksploziji-gasa-u-rusiji-sest-mrtvih/wjd4qm7'),(1496,5,545,'http://www.politika.rs/sr/clanak/367260/Tramp-sklonjen-s-bine-zbog-lazne-uzbune'),(1497,7,545,'http://www.rts.rs/page/stories/sr/story/10/svet/2516332/nevada-tramp-sklonjen-s-bine-zbog-lazne-uzbune.html'),(1498,3,545,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=05&nav_category=78&nav_id=1196186'),(1499,2,546,'http://www.blic.rs/vesti/svet/kurc-zatvoriti-granice-umesto-sporazuma-sa-turskom/lb86lh5'),(1500,7,546,'http://www.rts.rs/page/stories/sr/story/11/region/2516385/kurc-zatvoriti-granice-umesto-sporazuma-sa-turskom.html'),(1501,3,546,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=06&nav_category=78&nav_id=1196294'),(1502,3,547,'http://www.b92.net/zivot/vesti.php?nav_id=1195709&fs=1'),(1503,7,547,'http://www.rts.rs/page/magazine/sr/story/471/svet-poznatih/2516343/ap-melanija-tramp-radila-kao-model-bez-radne-vize.html'),(1504,5,547,'http://www.politika.rs/sr/clanak/367257/AP-Melanija-Tramp-radila-kao-model-bez-radne-vize'),(1505,2,547,'http://www.blic.rs/vesti/svet/ap-melanija-tramp-radila-kao-model-bez-radne-vize/sj4lhle'),(1506,2,548,'http://www.blic.rs/kultura/vesti/dodeljene-nagrade-56-oktobarskog-salona/xrf2rlf'),(1507,8,548,'http://www.danas.rs/kultura.11.html?news_id=331618&title=Sini%c5%a1i+Ili%c4%87u+nov%c4%8dana+nagrada'),(1508,2,548,'http://www.blic.rs/kultura/vesti/svecana-dodela-nagrada-za-kraj-ljubavnog-zanosa/w0dwdv1'),(1509,9,549,'http://www.kurir.rs/vesti/politika/regionalni-seminar-politikologa-na-kopaoniku-izbori-u-sad-od-planetarne-vaznosti-clanak-2527601'),(1510,8,549,'http://www.danas.rs/svet.1160.html?news_id=331555&title=Izbori+u+SAD+ne%c4%87e+uticati+na+spoljnu+politiku'),(1511,8,550,'http://www.danas.rs/drustvo.55.html?news_id=331609&title=Kosovo%3a+Sedmoro+uhap%c5%a1eno+zbog+protivustavnog+delovanja'),(1512,3,550,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=05&nav_category=640&nav_id=1196159'),(1513,7,550,'http://www.rts.rs/page/stories/sr/story/135/hronika/2515955/kosovo-uhapseno-sedam-osoba-osumnjicenih-za-terorizam.html'),(1514,2,551,'http://www.blic.rs/vesti/drustvo/istina-o-vladici-nikolaju-mozda-nije-bio-bezgresan-ali-isti-kao-stepinac-sigurno-nije/f5zw1w3'),(1515,7,551,'http://www.rts.rs/page/stories/sr/story/125/drustvo/2515371/hocevar-zeli-dijalog-sa-sinodom-spc.html'),(1516,1,552,'http://www.alo.rs/ujedinjuje-se-kipar/79967'),(1517,3,552,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=05&nav_category=78&nav_id=1196270'),(1518,5,553,'http://www.politika.rs/sr/clanak/367226/Bandic-za-referendum-o-preimenovanju-Trga-marsala-Tita'),(1519,3,553,'http://www.b92.net/info/vesti/index.php?yyyy=2016&mm=11&dd=05&nav_category=167&nav_id=1196127'),(1520,2,553,'http://www.blic.rs/vesti/svet/zagrepcani-ce-na-referendumu-odlucivati-o-trgu-marsala-tita/30g42ps'),(1521,7,555,'http://www.rts.rs/page/sport/sr/story/36/fudbal/2516456/napoli-nudi-20-miliona-za-mitrovica.html'),(1522,9,555,'http://www.kurir.rs/sport/fudbal/srbin-na-ceni-napoli-nudi-20-miliona-za-mitrovica-clanak-2528121'),(1523,4,555,'http://www.telegraf.rs/sport/2444310-tek-u-italiji-bi-ludeo-napoli-nudi-20-miliona-za-mitrovica'),(1524,7,556,'http://www.rts.rs/page/sport/sr/story/36/fudbal/2516515/gajic-zabranio-sam-komentarisanje-sudjenja.html'),(1525,3,556,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=06&nav_id=1196345'),(1526,2,556,'http://sport.blic.rs/fudbal/domaci-fudbal/vosa-nece-teorije-zavere-gajic-zabranio-sam-komentarisanje-sudenja-nismo-nevoljeno/0re15q7'),(1527,1,557,'http://www.alo.rs/sikimic-kao-da-sam-igrao-dve-utakmice/80042'),(1528,5,557,'http://www.politika.rs/sr/clanak/367243/Sport/Minimalna-pobeda-sampiona-u-Cacku'),(1529,9,558,'http://www.kurir.rs/sport/fudbal/ceca-kao-motiv-trener-napretka-obecao-fudbalerima-odlazak-na-koncert-a-posle-pobede-desilo-se-ovo-clanak-2527747'),(1530,1,558,'http://www.alo.rs/ceca-docekala-n-dajea-i-drugove/80058'),(1531,2,558,'http://sport.blic.rs/fudbal/domaci-fudbal/fenomen-napredak-sesti-vezani-trijumf-i-cecin-koncert-treneru-ispuni-obecanje/xv3l4eh'),(1532,3,559,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=05&nav_id=1196055'),(1533,3,560,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=05&nav_id=1196238'),(1534,2,560,'http://sport.blic.rs/fudbal/evropski-fudbal/celsi-razbio-everton-kao-sat-matic-ne-gresi-i-asistira/zngf676'),(1535,9,560,'http://www.kurir.rs/sport/fudbal/video-plavci-u-furioznoj-seriji-celsi-demolirao-everton-i-noci-na-vrhu-tabele-clanak-2527653'),(1536,7,561,'http://www.rts.rs/page/sport/sr/story/36/fudbal/2516507/partizan-docekuje-novi-pazar.html'),(1537,3,563,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=06&nav_id=1196295'),(1538,3,563,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=06&nav_id=1196288'),(1539,2,564,'http://sport.blic.rs/kosarka/domaca-kosarka-i-aba/simonovic-za-blic-u-derbiju-ce-prstati-neka-se-partizan-spremi/7hpk0hs'),(1540,6,564,'http://www.novosti.rs/vesti/sport.295.html:633666-Zvezda-arhivirala-poraz-od-Baskonije-i-posvetila-se-duelu-s-crno-belima-Za-Partizan-uvek-spremni'),(1541,3,565,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=05&nav_id=1196281'),(1542,2,565,'http://sport.blic.rs/kosarka/domaca-kosarka-i-aba/aba-liga-megi-nikako-da-krene-ne-pomaze-ni-srpski-navaro-video/61peq6g'),(1543,9,566,'http://www.kurir.rs/sport/kosarka/video-srpski-rep-hit-u-americi-boban-marjanovic-zarazio-saigrace-pesmom-kes-kolica-clanak-2528043'),(1544,2,566,'http://sport.blic.rs/kosarka/nba/srpski-rep-za-nba-zvezdu-bobi-i-dramond-u-epizodi-kes-kolica-video/vd25w3x'),(1545,2,567,'http://sport.blic.rs/kosarka/evropska-kosarka/odlican-pet-marina-maljkovic-rusi-sve-redom-sa-galatasarajem/7xlevew'),(1546,7,567,'http://www.rts.rs/page/sport/sr/story/37/kosarka/2516137/marina-maljkovic-bliski-susret-sa-sudijom.html'),(1547,1,567,'http://www.alo.rs/sudija-u-naletu-pokosio-marinu-maljkovic-video/79971'),(1548,9,567,'http://www.kurir.rs/sport/kosarka/video-brutalan-sudar-sudija-nije-primetio-marinu-maljkovic-pa-je-pokosio-kraj-aut-linije-clanak-2527333'),(1549,9,568,'http://www.kurir.rs/sport/kosarka/bobi-slavio-protiv-nikole-jokic-sest-marjanovic-dva-bjelica-bez-poena-clanak-2528069'),(1550,2,570,'http://sport.blic.rs/tenis/prijatelju-svaka-cast-ovako-je-nadal-cestitao-endiju-na-uspehu/m97setf'),(1551,9,570,'http://www.kurir.rs/sport/tenis/slavni-reditelj-stao-u-odbranu-dokovica-kome-smeta-nole-nacionale-clanak-2528177'),(1552,9,570,'http://www.kurir.rs/sport/tenis/dokovic-moze-da-zavrsi-godinu-kao-broj-jedan-evo-kako-nole-moze-da-se-vrati-na-prvo-mesto-clanak-2527291'),(1553,2,570,'http://sport.blic.rs/tenis/ko-je-zapravo-najbolji-novak-je-morao-da-briljira-da-bi-bio-prvi-a-marej/sfpnbf9'),(1554,2,571,'http://sport.blic.rs/tenis/ti-si-nasa-inspiracija-ovako-je-svet-tenisa-reagovao-na-proboj-mareja-na-prvo-mesto/frb9n6h'),(1555,3,572,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=05&nav_id=1196230'),(1556,5,572,'http://www.politika.rs/sr/clanak/367230/Sport/Tenis/Endi-Mari-bez-igre-prvi-na-svetu'),(1557,3,572,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=05&nav_id=1196232'),(1558,7,572,'http://www.rts.rs/page/sport/sr/story/38/tenis/2516109/mari-nisam-verovao-da-cu-uspeti-novak-je-bio-neverovatan.html'),(1559,3,573,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=05&nav_id=1196152'),(1560,7,573,'http://www.rts.rs/page/sport/sr/story/38/tenis/2515984/izner-preko-cilica-do-finala-pariza.html'),(1561,1,573,'http://www.alo.rs/izner-perfektan-protiv-cilica/79968'),(1562,3,574,'http://www.b92.net/sport/vesti.php?yyyy=2016&mm=11&dd=05&nav_id=1196208'),(1563,1,574,'http://www.alo.rs/evo-zasto-raonic-nije-uzasao-na-megdan-mariju/79991');
/*!40000 ALTER TABLE `news_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(120) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sources`
--

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
INSERT INTO `sources` VALUES (1,'','ALO'),(2,'','Blic'),(3,'','B92'),(4,'','Telegraf'),(5,'','Politika'),(6,'','Novosti'),(7,'','RTS'),(8,'','Danas'),(9,'','Kurir');
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_categories`
--

DROP TABLE IF EXISTS `user_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_categories`
--

LOCK TABLES `user_categories` WRITE;
/*!40000 ALTER TABLE `user_categories` DISABLE KEYS */;
INSERT INTO `user_categories` VALUES (1,1,1,0),(2,1,2,1),(3,1,3,0);
/*!40000 ALTER TABLE `user_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_keywords`
--

DROP TABLE IF EXISTS `user_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `keyword` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_keywords`
--

LOCK TABLES `user_keywords` WRITE;
/*!40000 ALTER TABLE `user_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_votes`
--

DROP TABLE IF EXISTS `user_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `voted` int(11) DEFAULT '0',
  `visited` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_votes`
--

LOCK TABLES `user_votes` WRITE;
/*!40000 ALTER TABLE `user_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test@test','test');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-06 13:31:20
