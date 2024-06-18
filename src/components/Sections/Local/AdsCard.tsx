import React, { FC } from "react";

type Props = {
  imgLink: string;
  title: string;
};

const AdsCard: FC<Props> = ({ imgLink, title }) => {
  return (
    <figure className="relative w-[210px] h-[130px]">
      <img
        className="object-cover object-center h-full w-full"
        src={imgLink}
        alt=""
      />
      <div className="absolute inset-0 m-0 bg-gradient-to-t from-black/60 via-black/50" />
      <figcaption className="absolute text-white bottom-4 left-0 w-full max-w-[356px] cursor-pointer ml-2">
        <p className="font-inter text-[10px] max-w-[110px]">{title}</p>
      </figcaption>
    </figure>
  );
};

export default AdsCard;
