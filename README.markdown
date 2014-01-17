<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.da"><img alt="Creative Commons licens" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />Dette værk er licenseret under en <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.da">Creative Commons Navngivelse-DelPåSammeVilkår 3.0 Unported Licens</a>.

Installer Drush og drush make
--------------------
* Udfør: `sudo pear channel-discover pear.drush.org`
* Udfør: `sudo pear install drush/drush`

Hent filer og opret site folder og database m.m.
------------------------------------------
Drupal Version: 7.24

Drush Version: 5.8

Installer Camping med drush make filer.

1. `cd [web dir]`
2. `drush dl drupal-7.24 --drupal-project-rename=public_html`
3. `git clone git@github.com:bellcom/camping-deploy.git`

    Kør deploy script. Afhængig af hvilken profil der ønskes skal reroll.dev.sh eller reroll.sh køres og linkes til profiles diret. Alle moduler bliver hentet fra master branchen. Hold øje med dette under udvikling. Alle repositories er git repos.

4. `cd camping-deploy`, `./reroll.dev.sh` eller `./reroll.sh`. Kan tage lang tid at køre, da den henter alle moduler. Kan kræve sudo. Følg med i log om der sker fejl. Ved fejl på contrib moduler prøv evt igen, da det kan skyldes i dårlig håndtering fra Drush.
5. `cd ../public_html/profiles`
6. `ln -s ../../camping-deploy/build/master-latest camping` eller `ln -s ../../camping-deploy/build/dev-latest camping`
7. Udfør `sudo chmod g+rwX /var/www/[dit domæne]`
8. Udfør `sudo chgrp -R www-data /var/www/[dit domæne]`
9. Installer sitet på `http://[dit domæne]/install.php`. Følg guiden, her skal du desuden bruge dine informationer til databasen.
10. Udfør `drush cc registry` og `drush cc all`.
11. Udfør `chmod -w sites/default/settings.php sites/default/`
12. Sæt cron op for sitet. `drush vget cron_key`. Gem key. `sudo crontab -u www-data -e` og indsæt (erstat SITE og KEY): `0 * * * * /usr/bin/wget -O - -q -t 1 'http://SITE/cron.php?cron_key=KEY'`

Proceduren er at reroll.[].sh bruges når moduler skal opdateres fra origin.

