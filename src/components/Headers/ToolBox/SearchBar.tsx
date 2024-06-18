import React, { FormEvent, useState } from "react";
import { useNavigate } from "react-router-dom";
import { SEARCH } from "../../../tools/links";
import { useDispatch } from "react-redux";
import { POST_SEARCH } from "../../../redux/types";

const SearchBar = ({ prefLang }: { prefLang: string }) => {
  // useState
  const [searchString, setSearchString] = useState("");

  // Hooks
  const navigate = useNavigate();
  const dispatch = useDispatch();

  // Function
  const search = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (searchString !== "") {
      dispatch({
        type: POST_SEARCH,
        payload: { name: searchString, lang: prefLang },
      });
      navigate(SEARCH, { state: { searchString, prefLang } });
      setSearchString("");
    }
  };

  return (
    <form
      className="relative block h-max w-max cursor-pointer"
      onSubmit={search}
    >
      <input
        className="focus:w-full w-[55px] pr-4 focus:outline-none focus:bg-[#F7F5F9] placeholder:text-[#393939] bg-transparent"
        placeholder={prefLang === "Tm" ? "Gözleg..." : "Поиск..."}
        type="text"
        value={searchString}
        onChange={(e) => setSearchString(e.target.value)}
      />
      <span className="absolute inset-y-0 right-0 flex items-center">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="12"
          height="12"
          viewBox="0 0 12 12"
          fill="#393939"
        >
          <path
            d="M0.95 5.76791C0.95 8.42369 3.11213 10.5858 5.76791 10.5858C8.42369 10.5858 10.5858 8.42369 10.5858 5.76791C10.5858 3.11213 8.42369 0.95 5.76791 0.95C3.11213 0.95 0.95 3.11213 0.95 5.76791ZM1.74774 5.76791C1.74774 3.55341 3.54883 1.74774 5.76791 1.74774C7.98699 1.74774 9.78807 3.55341 9.78807 5.76791C9.78807 7.98241 7.98699 9.78807 5.76791 9.78807C3.54883 9.78807 1.74774 7.98241 1.74774 5.76791Z"
            fill="#393939"
            stroke="#393939"
            stroke-width="0.1"
          />
          <path
            d="M10.3698 10.9333C10.4494 11.013 10.5508 11.0503 10.6517 11.0503C10.7526 11.0503 10.8539 11.013 10.9336 10.9333C11.088 10.7789 11.088 10.5239 10.9336 10.3695L10.0032 9.43908C9.84875 9.28464 9.5938 9.28464 9.43936 9.43908C9.28493 9.59351 9.28493 9.84847 9.43936 10.0029L10.3698 10.9333Z"
            fill="#393939"
            stroke="#393939"
            stroke-width="0.1"
          />
        </svg>
      </span>
    </form>
  );
};

export default SearchBar;
