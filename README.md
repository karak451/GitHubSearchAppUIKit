Próbálkozás GitHub Repository-k közt kereső app létrehozására, UIKit-ben

Eredmények:
- A mintául szolgáló SwfitUI-ban írt apphoz egészen hasonló szövegbeviteli rész kialakítása (az opcionális minősítő mezővel, ami elrejthető)
- A lista elem sablonjának kialakítása ugyanúgy a SwifUI verziót követve
- A UITextField-ből a kulcsszóval a ViewModelben tárolt változó frissítése, ezt követően a GitHub keresés lefuttatása
- Delegate-tel megoldani a lekérdezés státuszváltozásának változásait, lekérdezés végén a UIContentView újratöltése

  Elakadás leírása:
  <b>A "cv" néven deklarált UICollectionView működése nem teljes, nem fut le a collectionView(...cellForItemAt indexPath: IndexPath) funkció</b>
  - Meggyőződtem róla, hogy a collectionView konstruktorában megadott layout magassága nem 0 (állítólag van, hogy 0 magasság miatt nem fut le)
  - Meggyőződtem róla, hogy nincs constraints hiba a layoutban
  - Meggyőződtem róla, hogy nem az egyes listaelemek megjelenítését elvégző UICollectionViewCell-lel van a hiba, mert az ott elhelyezett breakpointokat és printeket nem érte el a teszt
  - Meggyőződtem róla, hogy a numberOfItemSection-t lekérő funkció megkapja a listaelemek számát
  - Így egyben arról is meggyőződtem, hogy a viewControllerben, amiben a collectionView található, hozzáférhető a viewModel-ben tárolt adat
  - a viewModelben megírt delegate megfelelő funkciója triggerelve van mikor a GitHub keresés befejeződik (és megjön az adat), ehhez kapcsolódóan a collecionView .reloadData() funkcióját ellövöm


<a href="https://github.com/karak451/GitHubSearchAppInSwiftUI">SwiftUI verzió</a>
 || 
<a href="https://github.com/karak451/GitHubSearchAppInJetpackCompose">Jetpack Compose verzió</a>

képek:
<div style="width: 50%;">
<img src="https://azatlasz.hu/appok/img/uikit1.png" style="width: 25%;">
  <img src="https://azatlasz.hu/appok/img/uikit2.png" style="width: 25%;">
  <img src="https://azatlasz.hu/appok/img/uikit3.png" style="width: 25%;">
</div>
  
