class InlineTagsList{
  List<String?>? _idtaglist;
  InlineTagsList();
  List<String> get idtaglist {
    List<String> idtags = [];
    for (var  tag in alltags) {
        final tg = int.tryParse(tag);
        if(tg != null){
            idtags.add(tag);
        }
    }
    return idtags;
  }
  set idtaglist(List<String> value) 
   {
    //List<String> idtags = [];
    for (var  tag in alltags) {
        final tg = int.tryParse(tag);
        if(tg != null){
            _idtaglist!.add(tag);
        }
    }
    //return _idtaglist;
  }
  List<String> get nametaglist {
    List<String> nametags = [];
    for (var  tag in alltags) {
        final tg = int.tryParse(tag);
        if(tg == null){
            nametags.add(tag);
        }
    }
    return nametags;
  }

  List<String> alltags = ["1037",".NET Compact Framework","1265",".NET Framework","905",".NET Micro Framework","833",".NET/Mono","455","3D Animation","485","3D Architecture","515","3D Modelling","1788","3D Printing","1687","3D Render Artlantis","1644","3D Rendering","521","3ds Max","1971","AAA Logo","95","Accounting","1073","ActionScript","1592","ActiveDirectory","569","Adlibs","1313","Administration","5","Administrative Support","1962","Adobe Acrobat","665","Adobe After Effects","1756","Adobe AIR","1079","Adobe Captivate","1085","Adobe Director","1959","Adobe Dreamweaver","947","Adobe Flash","431","Adobe Illustrator","1753","Adobe Indesign","341","Adobe PageMaker","401","Adobe PhotoShop","671","Adobe Premiere","269","Advertising","209","Affiliate Marketing","1870","Ajax","1674","Analysis","1043","Android","1846","Android studio","2061","Andromo","1676","AngularJS","461","Anim8or","311","Animation","719","Antivirus","1702","Apache","1715","Apache Cordova","1924","API Gateway","2085","App Geyser","2082","App Inventor","1713","Appcelerator Titanium","2133","Appery","2067","AppMachine","2127","AppMakr","1828","Appraisal","1831","Appraisement","2124","Appy Pie","1723","Arabian","317","Architecture","911","Arduino","323","Artwork","1103","ASP.NET","1773","Assembly","1694","Asterisk","917","Atmel","1669","Atmel AVR","2187","Atom","641","Audacity","575","Audio Editing","581","Audio Production","2214","Audio Recorder","491","AutoCAD","1793","AutoIt","1671","AVR Studio","1761","Backbone.js","1608","Bala balin","1718","BASCOM","977","Bash/Shell","2043","Behance","1785","BlackBerry","467","Blender","1337","Blog","1343","Blogspot","2088","Bluestacks","1602","Bootstrap","329","Brochure","41","Business Analysis","53","Business Consultation","101","Business Document Translation","275","Business Plans","59","Business Proposals","89","Business Service","1271","C#","1277","C/C++","1181","CakePHP","599","Cakewalk","1992","Canva","65","Cashflow Analysis","497","Chief Architect","107","Chinese","473","Cinema 4D","1550","Cisco","1720","Civil and Structure Analysis","1721","Civil and Structure Design","1367","CMS Made Simple","1019","Cocoa","1187","CodeIgniter","1933","Cognito","1109","Cold Fusion","1373","Concrete5","2151","ConnectWise Control","1874","construct","1834","Consultancy","1361","Content Management System (CMS)","1883","Content Writer","1798","Copywriter","407","Corel PhotoPaint","347","CorelDRAW","1319","CPanel","827","Cross Platform Programming","1638","CryENGINE","1691","Cryptography","1544","CSS","1487","CSS Templates","167","Customer Service","1719","CVAVR","1738","Dapper","2166","Darktable","1746","Data Analysis","11","Data Entry","1825","Data Integration","1750","Data Mining","869","Database Programming","2016","Daz Studio","1568","Debian","1283","Delphi","2058","Delphi 2010 Seattle","839","Delphi XE/XE2","305","Design Arts","2118","DesignMantic","1699","Desktop Programming","335","Desktop Publishing","1864","Dev Manager","2163","digiKam","1325","DirectAdmin","953","DirectX/DirectShow","1241","Django Framework","2046","Dribbble","2094","Droid4x","1193","Drupal","1493","Drupal Templates","113","Dutch","755","Dutch","1930","DynamoDB","1886","e book","1403","E-Commerce","2049","Eclipse","1939","Electonic","1661","Electronic Circuit Design","1657","Electronic Design","689","Email Handling","215","Email Marketing","173","Email Support","923","Embedded Linux","1663","Embedded System","1725","Ember.js","119","English","1732","Entity Framework","1722","ETABS","2211","Etcher","1618","Exterior Design","1778","Facebook","1843","Final Draft","695","Financial Planning","875","Firebird","899","Firmware Programming","1913","Fisika","1115","Flash/ActionScript","1593","Flask Python","1121","Flex","1942","Flutter","17","Form Processing","1439","Forums","1867","foxpro for Windows","1695","FreePBX","1716","FreeSWITCH","125","French","647","FruityLoops","941","Game Programming","2130","GameSalad","845","GCC","983","GCC","2196","Gdebi","2091","Genymotion","1626","Geographical Information System","1624","Geospatial","131","German","413","Gimp","1610","Git","1948","Github","1628","Global Positioning System","989","Gnome","1945","Golang","2073","Good Barber","1774","Google Adsense","1776","Google Adwords","1652","Google App Engine","2028","Google Charts","1650","Google Cloud Developer","1654","Google Cloud Engine","1656","Google Cloud Platform","2040","Google Fonts","1630","Google Maps","533","Google SketchUp","1133","Google Web Toolkit (GWT)","2142","GoToMyPC","2103","Grafis Vektor","377","Graphic Design","1983","Gravit Designer","2175","Handbrake","2019","Hexagon","1599","Hibernate","1895","Hindi","701","Homework","2025","Houdini Apprentice","1538","HTML","383","Illustration","1791","iMacros","2034","Infogram","443","InkScape","1813","Instagram","1457","Integration","1616","Interior Design","221","Internet Campaign","203","Internet Marketing","1711","Ionic Framework","1910","IP PABX","1049","iPhone/iOS","353","iStudio Publisher","137","Italian","143","Japanese","959","Java","1816","Java Native","1596","Java Spring MVC","1620","Java Swing","1139","JavaScript","587","Jingles","1199","Joomla","1145","jQuery","1622","JSON","1556","Juniper","539","K-3D","2157","Kaseya VSA","2181","Kazam","995","KDE","2169","Kdenlive","1763","Keynote","1919","Kimia","2037","Klex","1205","Kohana","149","Korean","2001","Krita","1927","Lambda","1605","Laravel Framework","251","Legal Consultation","2184","LibreOffice","545","LightWave 3D","725","Linux","1701","Linux Administration","971","Linux Programming","389","Logo Design","2121","Logos by Tweak","1013","Mac OS Programming","731","MacOS","1977","Macromedia Freehand","1409","Magento","2115","Makr","1901","Malaysia","1980","Manga Studio","281","Market Research","287","Marketing Strategy","1953","Matematic","1916","Matematika","1729","Matlab","479","Maya","1612","Mercurial","1757","MeteorJS","1665","Microcontroller","1526","Microsoft Access","1520","Microsoft Excel","1586","Microsoft Exchange","1508","Microsoft Office","359","Microsoft Office Publisher","623","Microsoft PowerPoint","1965","Microsoft Visual Basic NET","1514","Microsoft Word","593","MIDI","1562","Mikrotik","851","MinGW","1031","Mobile Programming","2070","MobileRoadie","1680","MongoDB","1151","MooTools","857","Mozilla","1904","MS SQL","449","Multimedia","1067","Multimedia Programming","1349","Multiply","1741","MVC","1742","MVVM","1855","MYOB","881","MySQL","2208","Neofetch","2052","NetBeans","2145","Netop Remote Control","1707","Network Security","1532","Networking","1703","Nginx","1678","NodeJS","1025","Objective C","2106","Objective-C","1852","Ocs Panell","1889","Oddo","1415","OpenCart","1634","OpenGL","1705","OpenWRT","887","Oracle","179","Order Processing","1421","osCommerce","2007","Paint.NET","227","Pay-per-Action Marketing (PPA)","233","Pay-per-Click Marketing (PPC)","1697","Penetration Testing","1822","Pentaho","1169","Perl","683","Personal Assistant","185","Phone Support","1709","PhoneGap","1998","Photo Pos Pro","605","Photography","1175","PHP","1445","phpBB","929","PIC","2160","Pinta","2004","Pixlr","2193","PlayOnLinux","1898","Portugal","551","Poser","1974","PosteRazor","893","PostgreSQL","617","Presentations","1861","Prestashop","1427","PrestaShop","293","Pricing","821","Programming","1840","Proofreading","965","PyGame","863","Python","1211","QCodo/QCubed","1157","Qooxdoo","1007","QT","1747","Quantitative Analysis","365","QuarkXPress","2217","Quicken","2220","RAB (Rencana Anggaran Biaya)","395","Raster Graphics","1995","RawTherapee","2109","React Native","1759","ReactJS","707","Remote Desktop Assistency","2139","RemotePC","1689","Render Engine Spt 3ds Max","23","Retyping","1672","Reviews","1767","RFID","557","Rhinoceros 3D","935","RISC","71","Risk Analysis","1667","Robotics","1771","Ruby","1247","Ruby on Rails","155","Russian","1936","S3","263","Sales and Marketing","1789","SAP","1837","Screenwriting","371","Scribus","1163","Scriptaculous","2022","Sculptris","239","Search Engine Optimization (SEO)","1682","Share Point Portal","2178","Shutter","1800","Sketch","2013","SketchUp","1765","Smart card programming","1499","Smarty Templates","245","Social Media Marketing (SMM)","713","Software Installation","1858","Solidworks","629","Song Writing","635","Soundtrack","1744","SPA (Single Page Apps)","161","Spanish","1739","SQL Server","1849","SSH","2205","Stacer","77","Statistical Analysis","2010","Sumo Paint","191","Support Service","1989","SVG-Edit","1614","SVN","503","SweetHome 3D","1642","Swift","2136","Swiftic","1696","Sybase PowerBuilder","1217","Symfony","2199","Synaptic","83","Tax Consultation","2154","TeamViewer","1749","Technical Analysis","197","Technical Support","299","Telemarketing","1790","Thailand","2064","TheAppBuilder","2112","Thunkable","1391","Tiki Wiki","29","Transcription","743","Translation","809","Travel Planning","509","TurboFloorPlan","1892","Turkey","1463","Tutorial/Assistant","1780","Twitter","1397","Typo3","1574","Ubuntu","1803","UI Design","419","Ulead PhotoImpact","2055","Unity","1632","Unity 3D","2202","Unity Tweak Tool","1956","Unix","1636","Unreal Engine","1806","UX Design","1646","V-Ray","1686","Vaadin Framework.","1907","VB.Net","1451","vBulletin","425","Vector Graphics","1986","Vectr","653","Video Editing","659","Video Production","2097","Virtual Box","1784","Visual Studio","2190","Visual Studio Code","1301","VisualBasic","2031","Vizualize.me","677","Voice Talent","1693","VOIP","1769","Watir","1469","Web Design","1097","Web Programming","35","Web Research","1752","Web Scrapping","1307","Website","1475","Website Building","1481","Website Templates","1331","WHM","1727","WHMCS","737","Windows","1055","Windows Mobile","1061","Windows Phone","1259","Windows Programming","1580","Windows Server","2100","Windroye","1731","WooCommerce","1355","Wordpress","1505","Wordpress Templates","1736","WPF (Windows Presentation Foundation)","815","Writing","1782","Xamarin","1968","Xara Designer","1640","Xcode","1878","XENFORO 2","1253","XHTML","1787","XML","2172","Xnconvert","1223","Yii","1819","Youtube","563","ZBrush","1433","Zen Cart","1229","Zend Framework","2148","Zendesk","1684","ZKoss Framework"];





}

String inlinetags = '["1037",".NET Compact Framework","1265",".NET Framework","905",".NET Micro Framework","833",".NET/Mono","455","3D Animation","485","3D Architecture","515","3D Modelling","1788","3D Printing","1687","3D Render Artlantis","1644","3D Rendering","521","3ds Max","1971","AAA Logo","95","Accounting","1073","ActionScript","1592","ActiveDirectory","569","Adlibs","1313","Administration","5","Administrative Support","1962","Adobe Acrobat","665","Adobe After Effects","1756","Adobe AIR","1079","Adobe Captivate","1085","Adobe Director","1959","Adobe Dreamweaver","947","Adobe Flash","431","Adobe Illustrator","1753","Adobe Indesign","341","Adobe PageMaker","401","Adobe PhotoShop","671","Adobe Premiere","269","Advertising","209","Affiliate Marketing","1870","Ajax","1674","Analysis","1043","Android","1846","Android studio","2061","Andromo","1676","AngularJS","461","Anim8or","311","Animation","719","Antivirus","1702","Apache","1715","Apache Cordova","1924","API Gateway","2085","App Geyser","2082","App Inventor","1713","Appcelerator Titanium","2133","Appery","2067","AppMachine","2127","AppMakr","1828","Appraisal","1831","Appraisement","2124","Appy Pie","1723","Arabian","317","Architecture","911","Arduino","323","Artwork","1103","ASP.NET","1773","Assembly","1694","Asterisk","917","Atmel","1669","Atmel AVR","2187","Atom","641","Audacity","575","Audio Editing","581","Audio Production","2214","Audio Recorder","491","AutoCAD","1793","AutoIt","1671","AVR Studio","1761","Backbone.js","1608","Bala balin","1718","BASCOM","977","Bash/Shell","2043","Behance","1785","BlackBerry","467","Blender","1337","Blog","1343","Blogspot","2088","Bluestacks","1602","Bootstrap","329","Brochure","41","Business Analysis","53","Business Consultation","101","Business Document Translation","275","Business Plans","59","Business Proposals","89","Business Service","1271","C#","1277","C/C++","1181","CakePHP","599","Cakewalk","1992","Canva","65","Cashflow Analysis","497","Chief Architect","107","Chinese","473","Cinema 4D","1550","Cisco","1720","Civil and Structure Analysis","1721","Civil and Structure Design","1367","CMS Made Simple","1019","Cocoa","1187","CodeIgniter","1933","Cognito","1109","Cold Fusion","1373","Concrete5","2151","ConnectWise Control","1874","construct","1834","Consultancy","1361","Content Management System (CMS)","1883","Content Writer","1798","Copywriter","407","Corel PhotoPaint","347","CorelDRAW","1319","CPanel","827","Cross Platform Programming","1638","CryENGINE","1691","Cryptography","1544","CSS","1487","CSS Templates","167","Customer Service","1719","CVAVR","1738","Dapper","2166","Darktable","1746","Data Analysis","11","Data Entry","1825","Data Integration","1750","Data Mining","869","Database Programming","2016","Daz Studio","1568","Debian","1283","Delphi","2058","Delphi 2010 Seattle","839","Delphi XE/XE2","305","Design Arts","2118","DesignMantic","1699","Desktop Programming","335","Desktop Publishing","1864","Dev Manager","2163","digiKam","1325","DirectAdmin","953","DirectX/DirectShow","1241","Django Framework","2046","Dribbble","2094","Droid4x","1193","Drupal","1493","Drupal Templates","113","Dutch","755","Dutch","1930","DynamoDB","1886","e book","1403","E-Commerce","2049","Eclipse","1939","Electonic","1661","Electronic Circuit Design","1657","Electronic Design","689","Email Handling","215","Email Marketing","173","Email Support","923","Embedded Linux","1663","Embedded System","1725","Ember.js","119","English","1732","Entity Framework","1722","ETABS","2211","Etcher","1618","Exterior Design","1778","Facebook","1843","Final Draft","695","Financial Planning","875","Firebird","899","Firmware Programming","1913","Fisika","1115","Flash/ActionScript","1593","Flask Python","1121","Flex","1942","Flutter","17","Form Processing","1439","Forums","1867","foxpro for Windows","1695","FreePBX","1716","FreeSWITCH","125","French","647","FruityLoops","941","Game Programming","2130","GameSalad","845","GCC","983","GCC","2196","Gdebi","2091","Genymotion","1626","Geographical Information System","1624","Geospatial","131","German","413","Gimp","1610","Git","1948","Github","1628","Global Positioning System","989","Gnome","1945","Golang","2073","Good Barber","1774","Google Adsense","1776","Google Adwords","1652","Google App Engine","2028","Google Charts","1650","Google Cloud Developer","1654","Google Cloud Engine","1656","Google Cloud Platform","2040","Google Fonts","1630","Google Maps","533","Google SketchUp","1133","Google Web Toolkit (GWT)","2142","GoToMyPC","2103","Grafis Vektor","377","Graphic Design","1983","Gravit Designer","2175","Handbrake","2019","Hexagon","1599","Hibernate","1895","Hindi","701","Homework","2025","Houdini Apprentice","1538","HTML","383","Illustration","1791","iMacros","2034","Infogram","443","InkScape","1813","Instagram","1457","Integration","1616","Interior Design","221","Internet Campaign","203","Internet Marketing","1711","Ionic Framework","1910","IP PABX","1049","iPhone/iOS","353","iStudio Publisher","137","Italian","143","Japanese","959","Java","1816","Java Native","1596","Java Spring MVC","1620","Java Swing","1139","JavaScript","587","Jingles","1199","Joomla","1145","jQuery","1622","JSON","1556","Juniper","539","K-3D","2157","Kaseya VSA","2181","Kazam","995","KDE","2169","Kdenlive","1763","Keynote","1919","Kimia","2037","Klex","1205","Kohana","149","Korean","2001","Krita","1927","Lambda","1605","Laravel Framework","251","Legal Consultation","2184","LibreOffice","545","LightWave 3D","725","Linux","1701","Linux Administration","971","Linux Programming","389","Logo Design","2121","Logos by Tweak","1013","Mac OS Programming","731","MacOS","1977","Macromedia Freehand","1409","Magento","2115","Makr","1901","Malaysia","1980","Manga Studio","281","Market Research","287","Marketing Strategy","1953","Matematic","1916","Matematika","1729","Matlab","479","Maya","1612","Mercurial","1757","MeteorJS","1665","Microcontroller","1526","Microsoft Access","1520","Microsoft Excel","1586","Microsoft Exchange","1508","Microsoft Office","359","Microsoft Office Publisher","623","Microsoft PowerPoint","1965","Microsoft Visual Basic NET","1514","Microsoft Word","593","MIDI","1562","Mikrotik","851","MinGW","1031","Mobile Programming","2070","MobileRoadie","1680","MongoDB","1151","MooTools","857","Mozilla","1904","MS SQL","449","Multimedia","1067","Multimedia Programming","1349","Multiply","1741","MVC","1742","MVVM","1855","MYOB","881","MySQL","2208","Neofetch","2052","NetBeans","2145","Netop Remote Control","1707","Network Security","1532","Networking","1703","Nginx","1678","NodeJS","1025","Objective C","2106","Objective-C","1852","Ocs Panell","1889","Oddo","1415","OpenCart","1634","OpenGL","1705","OpenWRT","887","Oracle","179","Order Processing","1421","osCommerce","2007","Paint.NET","227","Pay-per-Action Marketing (PPA)","233","Pay-per-Click Marketing (PPC)","1697","Penetration Testing","1822","Pentaho","1169","Perl","683","Personal Assistant","185","Phone Support","1709","PhoneGap","1998","Photo Pos Pro","605","Photography","1175","PHP","1445","phpBB","929","PIC","2160","Pinta","2004","Pixlr","2193","PlayOnLinux","1898","Portugal","551","Poser","1974","PosteRazor","893","PostgreSQL","617","Presentations","1861","Prestashop","1427","PrestaShop","293","Pricing","821","Programming","1840","Proofreading","965","PyGame","863","Python","1211","QCodo/QCubed","1157","Qooxdoo","1007","QT","1747","Quantitative Analysis","365","QuarkXPress","2217","Quicken","2220","RAB (Rencana Anggaran Biaya)","395","Raster Graphics","1995","RawTherapee","2109","React Native","1759","ReactJS","707","Remote Desktop Assistency","2139","RemotePC","1689","Render Engine Spt 3ds Max","23","Retyping","1672","Reviews","1767","RFID","557","Rhinoceros 3D","935","RISC","71","Risk Analysis","1667","Robotics","1771","Ruby","1247","Ruby on Rails","155","Russian","1936","S3","263","Sales and Marketing","1789","SAP","1837","Screenwriting","371","Scribus","1163","Scriptaculous","2022","Sculptris","239","Search Engine Optimization (SEO)","1682","Share Point Portal","2178","Shutter","1800","Sketch","2013","SketchUp","1765","Smart card programming","1499","Smarty Templates","245","Social Media Marketing (SMM)","713","Software Installation","1858","Solidworks","629","Song Writing","635","Soundtrack","1744","SPA (Single Page Apps)","161","Spanish","1739","SQL Server","1849","SSH","2205","Stacer","77","Statistical Analysis","2010","Sumo Paint","191","Support Service","1989","SVG-Edit","1614","SVN","503","SweetHome 3D","1642","Swift","2136","Swiftic","1696","Sybase PowerBuilder","1217","Symfony","2199","Synaptic","83","Tax Consultation","2154","TeamViewer","1749","Technical Analysis","197","Technical Support","299","Telemarketing","1790","Thailand","2064","TheAppBuilder","2112","Thunkable","1391","Tiki Wiki","29","Transcription","743","Translation","809","Travel Planning","509","TurboFloorPlan","1892","Turkey","1463","Tutorial/Assistant","1780","Twitter","1397","Typo3","1574","Ubuntu","1803","UI Design","419","Ulead PhotoImpact","2055","Unity","1632","Unity 3D","2202","Unity Tweak Tool","1956","Unix","1636","Unreal Engine","1806","UX Design","1646","V-Ray","1686","Vaadin Framework.","1907","VB.Net","1451","vBulletin","425","Vector Graphics","1986","Vectr","653","Video Editing","659","Video Production","2097","Virtual Box","1784","Visual Studio","2190","Visual Studio Code","1301","VisualBasic","2031","Vizualize.me","677","Voice Talent","1693","VOIP","1769","Watir","1469","Web Design","1097","Web Programming","35","Web Research","1752","Web Scrapping","1307","Website","1475","Website Building","1481","Website Templates","1331","WHM","1727","WHMCS","737","Windows","1055","Windows Mobile","1061","Windows Phone","1259","Windows Programming","1580","Windows Server","2100","Windroye","1731","WooCommerce","1355","Wordpress","1505","Wordpress Templates","1736","WPF (Windows Presentation Foundation)","815","Writing","1782","Xamarin","1968","Xara Designer","1640","Xcode","1878","XENFORO 2","1253","XHTML","1787","XML","2172","Xnconvert","1223","Yii","1819","Youtube","563","ZBrush","1433","Zen Cart","1229","Zend Framework","2148","Zendesk","1684","ZKoss Framework"]';
