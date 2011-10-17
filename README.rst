===========
MIF Starter
===========

VU MIF dokumentų XeLaTeX šablonas.

Struktūra::

    ├── common          – tai kas bendra visiems;
    ├── config          – konkretaus dokumento individualizavimas;
    ├── dist            – kompiliavimo katalogas;
    ├── part1           – pirmos dalies tekstas;
    └── partn           – n-osios dalies tekstas.

Naujo projekto sukūrimas
========================


#.  Klonuojame saugyklą::

        git clone git://github.com/vakaras/mif-starter.git ${PROJECT}

    Čia ``${PROJECT}`` yra katalogo, į kurį bus nukopijuota saugykla
    pavadinimas.

#.  Pakeičiame numatytąją saugyklą (daroma prielaida, kad esame
    projekto kataloge)::

        git remote rename origin template
        git remote add origin ${REPOSITORY}
        git push -u origin master

    Čia ``${REPOSITORY}`` yra pagrindinės projekto saugyklos adresas.

#.  Pritaikome ``config`` esančius failus pagal savo poreikius.
