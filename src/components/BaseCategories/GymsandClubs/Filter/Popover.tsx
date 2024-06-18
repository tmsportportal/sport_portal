import {
  Popover as MTPopover,
  PopoverHandler,
  PopoverContent,
  List,
  ListItem,
} from "@material-tailwind/react";
import { FC, useState } from "react";

interface Props {
  name: string;
  all: string;
  items: string[];
  setName: (name: string) => void;
}

export const Popover: FC<Props> = ({ name, all, items, setName }) => {
  const [open, setOpen] = useState(false);

  return (
    <MTPopover placement="top" handler={() => setOpen(!open)} open={open}>
      <PopoverHandler>
        <button
          type="button"
          className="p-0 bg-[#0088FF] flex justify-between max-w-[280px] w-full h-[45px] font-inter text-base px-7 items-center"
        >
          <p>{name || all}</p>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="20"
            height="10"
            viewBox="0 0 20 10"
            fill="none"
            className={`${
              open ? "rotate-180" : ""
            } transition-transform duration-300`}
          >
            <path
              d="M9.99998 9.91921C9.19237 9.91921 8.38475 9.6077 7.77327 8.99622L0.250938 1.4739C-0.0836459 1.13932 -0.0836459 0.585522 0.250938 0.250938C0.585522 -0.0836459 1.13932 -0.0836459 1.4739 0.250938L8.99623 7.77326C9.55003 8.32705 10.4499 8.32705 11.0037 7.77326L18.5261 0.250938C18.8607 -0.0836459 19.4145 -0.0836459 19.7491 0.250938C20.0836 0.585522 20.0836 1.13932 19.7491 1.4739L12.2267 8.99622C11.6152 9.6077 10.8076 9.91921 9.99998 9.91921Z"
              fill="white"
            />
          </svg>
        </button>
      </PopoverHandler>
      <PopoverContent
        className="rounded-none max-w-[280px] w-full border border-[#0088FF]"
        placeholder=""
      >
        <List className="p-0" placeholder="">
          <ListItem
            key={items?.length}
            onClick={() => setName(all)}
            className="hover:bg-blue-100 rounded-none w-full px-2"
            placeholder=""
          >
            {all}
          </ListItem>
          {items?.map((item, index) => {
            return (
              <ListItem
                key={index}
                onClick={() => setName(item)}
                className="hover:bg-blue-100 rounded-none w-full px-2"
                placeholder=""
              >
                {item}
              </ListItem>
            );
          })}
        </List>
      </PopoverContent>
    </MTPopover>
  );
};
