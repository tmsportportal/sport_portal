import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';

import '../../../widgets/custom_scaffold_with_button.dart';

class AboutUsScreen extends StatelessWidget {
  static const route = '/about_us';

  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffoldWithButton(
      title: context.loc.aboutUs,
      body: ListView(
        children: [
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'SPORTPORTAL',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: Text(
              context.loc.aboutUsSubtitle,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15.0),
          Image.asset('assets/images/about_us_img.png'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                context.loc.aboutUs,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 26.0),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TitleWithInfo(
                        title: 'Sport toplum',
                        info: '512',
                      ),
                      SizedBox(height: 10.0),
                      TitleWithInfo(
                        title: 'Sport mekdep',
                        info: '108',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TitleWithInfo(
                        title: 'Sport görnüş',
                        info: '45',
                      ),
                      SizedBox(height: 10.0),
                      TitleWithInfo(
                        title: 'Türgenleşik zal',
                        info: '221',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(aboutUsText),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}

class TitleWithInfo extends StatelessWidget {
  final String title;
  final String info;

  const TitleWithInfo({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            info,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}

const aboutUsText =
    '''Türkmenistan Garaşsyzlygyny gazanandan soňra ýurtda bedenterbiýe we sport hereketlerini ýola goýmagyň täze usullary kemala gelip ugrady hem-de şol ugurda halkara hyzmatdaşlygy alyp barmagyň düýp esasy goýuldy. 2007-nji ýylda Gurbanguly Berdimuhamedowyň Prezident wezipesine saýlanylmagy bilen döwlet gurlyşynyň we jemgyýetiň ähli ulgamlarynda, şol sanda sport ulgamynda hem özgertmeler geçirilip başlandy. Şol döwürden bäri ýurdumyzda bedenterbiýäniň we sportuň kämilleşmegi, adamyň kuwwatynyň maddy we ruhy taýdan sazlaşykly utgaşmagy netijesinde sagdyn durmuş ýörelgesine eýe bolmagy, şeýle hem sport ugry boýunça halkara hyzmatdaşlygyň giňelmegi döwlet syýasatymyzyň ileri tutulýan ugurlarynyň biri boldy.
Şeýle syýasaty durmuşa geçirmek maksady bilen diýarymyzyň ähli welaýatlarynda köpugurly stadionlar, bedenterbiýe we sagaldyş toplumlary, aýlawlar, sport mekdepleri we başga-da ş.m. desgalar bina edildi. Ýurdumyzda türgenlerdir hünärmenleri taýýarlamagyň täze usullary we sport oýunlaryny geçirmegiň tejribesi kämilleşdirildi, türkmen türgenleri bolsa daşary ýurtlarda geçirilýän sport ýaryşlaryna işjeň gatnaşyp başladylar. 2012-nji ýylyň 1-nji ýanwaryndan bäri «Türkmenistan–sport» telekanaly “Türkmenistan – sagdynlygyň we ruhubelentligiň ýurdy” şygary astynda alnyp barylýan bedenterbiýe we sport ugrunda gazanylan üstünlikleri beýan etmek, sagdyn durmuş ýörelgesini wagyz etmek üçin ýaýlymda yzygiderli gepleşikleri bermegini dowam edýär.
Türkmenistanyň aýratyn howa-klimat şertlerine garap, bu ýerde sportuň gyşky görnüşleri bilen meşgullanmaga giň mümkinçilikler döredildi. Aşgabatda sportuň gyşky görnüşleri boýunça Sport toplumy, “Awaza” milli syýahatçylyk zolagynda bolsa uly göwrümli buz meýdançalaryndan ybarat bolan köpugurly sport toplumy guruldy. Ýurdumyzda hokkeý boýunça milli çempionat oýunlary indi birnäçe ýyl bäri geçirilýär, şeýle hem sportyň figuralaýyn buzda typmak we şort-trek ýaly görnüşleri ösdürilýär.''';
