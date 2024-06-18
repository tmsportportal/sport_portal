import {
  Menu,
  MenuHandler,
  MenuItem,
  MenuList,
} from "@material-tailwind/react";
import tmflag from "../../../assets/svg/tmflag.svg";
import ruflag from "../../../assets/svg/ruflag.svg";
import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { setLangAction } from "../../../redux/actions/main";
import { RootState } from "../../../redux/store";

const SelectLang = () => {
  const dispatch = useDispatch();
  const [open, setOpen] = useState(false);
  const langs = useSelector((state: RootState) => state.main.langs);

  useEffect(() => {
    langs[0] = { ...langs[0], flag: tmflag };
    langs[1] = { ...langs[1], flag: ruflag };
    setPrefLang(0);
  }, [langs]);

  const [lang, setLang] = useState(langs[0]);
  const setPrefLang = (i: number) => {
    setLang(langs[i]);
    dispatch(setLangAction(langs[i].name));
  };

  return (
    <div className="flex items-center justify-center">
      <Menu open={open} handler={() => setOpen(!open)}>
        <MenuHandler>
          <button className="flex items-center justify-center capitalize tracking-normal p-0 outline-none shadow-none rounded-none">
            <img src={lang?.flag} alt="" />
            <p className="text-xs font-inter text-black px-[2px] font-normal">
              {lang?.name}
            </p>
            <svg
              width="8"
              height="3"
              viewBox="0 0 8 3"
              fill="none"
              className={`${
                open ? "rotate-180" : ""
              } h-max w-3 transition-transform duration-300`}
            >
              <path
                d="M1 0.400635L4 1.95617L7 0.400635"
                stroke="#393939"
                stroke-width="0.8"
                stroke-linecap="round"
                stroke-linejoin="round"
              />
            </svg>
          </button>
        </MenuHandler>
        <MenuList
          className="overflow-visible p-1 gap-1 text-xs font-inter outline-none rounded-none"
          placeholder=""
        >
          <MenuItem
            className="hover:text-[#08F] rounded-none flex items-center justify-center"
            onClick={() => setPrefLang(0)}
            placeholder=""
          >
            TM
          </MenuItem>
          <MenuItem
            className="hover:text-[#08F] rounded-none flex items-center justify-center"
            onClick={() => setPrefLang(1)}
            placeholder=""
          >
            RU
          </MenuItem>
        </MenuList>
      </Menu>
    </div>
  );
};

export default SelectLang;
