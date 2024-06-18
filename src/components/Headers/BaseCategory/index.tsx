import React from "react";
import NavList from "./NavList";
import wertical from "./svg/wertical.svg";

const BaseCategoriesList = () => {
  return (
    <section className="w-full h-9 flex justify-center shadow-[0_5px_2px_-2px_rgba(0,0,0,0.3)]">
      <nav className="font-oswald text-sm h-full flex justify-between max-w-[1170px] w-full">
        <div className="flex items-center justify-between h-full w-full gap-2">
          <div className="flex items-center justify-between font-oswald text-xs max-w-[280px] w-full">
            <a
              className="flex cursor-pointer items-center"
              href="https://turkmentv.gov.tm/live"
              target="_blank"
              rel="noreferrer"
            >
              <img
                src="/icons/basecategory/logo_tst.png"
                className="w-6 h-5 pr-1"
                alt=""
              />
              <div className="flex flex-col leading-[8px] relative">
                <p className="text-[#00843D]">TÜRKMENISTAN</p>
                <p className="text-[#BFB55C] text-[8px] text-right absolute right-0 bottom-[-8px]">
                  SPORT TV
                </p>
              </div>
            </a>
            <a
              className="flex items-center cursor-pointer pr-1"
              href="https://www.youtube.com/@turkmensport_tm"
              target="_blank"
              rel="noreferrer"
            >
              <img
                src="/icons/basecategory/logo_youtube.png"
                className="w-7 h-4 pr-1"
                alt=""
              />
              <p className="text-[#0F1A42]">YOUSPORT</p>
            </a>
            <a
              className="flex cursor-pointer pr-1 items-center"
              href="https://www.instagram.com/sportportal.tm"
              target="_blank"
              rel="noreferrer"
            >
              <img
                src="/icons/basecategory/logolive.gif"
                className="w-8 h-7 pr-1"
                alt=""
              />
              <p className="text-[#F44336]">LIVE</p>
            </a>
          </div>
          <img src={wertical} alt="" />
          <NavList />
        </div>
      </nav>
    </section>
  );
};

export default BaseCategoriesList;
