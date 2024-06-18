import React, { FC } from "react";

// Text
const aboutUsTextTm = `Berkarar döwletiň täze eýýamynyň Galkynyşy döwründe Arkadagly Gahryman Serdarymyzyň taýsyz tagallalary netijesinde ýurdumyzda ylym-bilim, saglygy goraýyş we sport ulgamlaryna uly üns berilýär. Esasan hem sportuň we bedenterbiýäniň ýurdumyzda tutýan ornuny giňeltmekde, ony sanly ulgama geçirmekde we köpçülikleýin habar beriş serişdelerine ýetirmekde ähli şertler döredilýär.

Hormatly Prezidentimiz Serdar Berdimuhamedowyň: “Sportuň, bedenterbiýäniň ýörgünli bolmagy, birinjiden, halkyň, esasan hem ýaşlaryň saglygy üçin uly ähmiýetli bolsa, ikinjiden, dünýäde ýurduň sport abraýynyň ýokarlandyrylmagyny şertlendirýär” diýen paýhasly sözlerinden ugur alyp, biz hem ata Watanymyzyň Sport ulgamynda ösüşine öz mynasyp goşandymyzy goşmak maksady bilen ýurdumyzdaky ilkinji SPORTPORTAL ulgamyny taýýarladyk.

SPORTPORTAL – türkmen sporty barada taýýarlanylan ilkinji ulgam bolup, bu ulgam arkaly biz milli türgenlerimizi halkymyza hem-de dünýä ýüzüne tanadýarys we ýaş neslimiziň sporta bolan höwesini has-da artdyrýarys. Ýurdumyzyň sport federasiýalaryny, ussat tälimçilerini, türgenlerini we olaryň alyp barýan işlerini köpçülikleýin habar beriş serişdelerine çykarmak, gündelik geçirilýän sport çäreleri, bäsleşikleri we täzelikleri halkymyza sanly ulgamyň üsti bilen hödürlemek – ulgamymyzyň esasy maksadydyr.`;
const aboutUsTextRu = `В период возрождения новой эпохи стабильного государства, в результате неустанных усилий нашего Архигероя Сердара, большое внимание уделяется системе науки и образования, здравоохранения и спорта в нашей стране. В частности, созданы все условия для расширения роли спорта и физического воспитания в стране, перевода их в цифровую систему и в средства массовой информации.
По мудрым словам нашего Президента Сердара Бердымухамедова: «Успехи спорта и физической культуры, во-первых, имеют большое значение для здоровья народа, особенно молодежи, а во-вторых, обусловливают улучшение спортивной репутации». страны в мире», и внесу свой достойный вклад в развитие спортивной системы Родины. Для этого мы подготовили первую в нашей стране систему «СПОРТПОРТАЛ».

СПОРТПОРТАЛ — первая система, разработанная для туркменского спорта, и с помощью этой системы она направлена ​​на то, чтобы познакомить наших национальных спортсменов с нашим народом и миром, а также повысить энтузиазм нашего молодого поколения к спорту. Спортивные федерации страны, наши главные тренеры, наши спортсмены должны освещать свою деятельность в средствах массовой информации, представлять ежедневные спортивные события, соревнования и новости нашему народу через цифровую систему.`;

// Title
const aboutUsTitleTm = "Biz barada";
const aboutUsTitleRu = "О нас";

interface Props {
  lang: string;
}

const AboutUs: FC<Props> = ({ lang }) => {
  return (
    <div className="w-full text-center flex flex-col gap-6">
      <p className="capitalize font-oswald text-5xl">
        {lang === "Tm" ? aboutUsTitleTm : aboutUsTitleRu}
      </p>
      <p className="text-justify text-xl whitespace-pre-line leading-relaxed">
        {lang === "Tm" ? aboutUsTextTm : aboutUsTextRu}
      </p>
    </div>
  );
};

export default AboutUs;
