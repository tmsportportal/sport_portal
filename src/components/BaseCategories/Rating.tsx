import React from "react";
import { Rating as MT_Rating } from "@material-tailwind/react";

interface Props {
  className?: string;
  gap?: string;
  readonly?: boolean;
  value: number;
}

const Rating = ({ value, className, gap, readonly }: Props) => {
  const ratedIcon = (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="48"
      height="44"
      viewBox="0 0 48 44"
      fill="none"
      className={className || "h-11 w-12"}
    >
      <path
        d="M24 0L32.158 13.5L48 16.8065L37.2 28.4565L38.8328 44L24 37.7L9.16718 44L10.8 28.4565L0 16.8065L15.8419 13.5L24 0Z"
        fill="#DFB300"
      />
    </svg>
  );
  const unratedIcon = (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="54"
      height="44"
      viewBox="0 0 54 44"
      fill="none"
      className={className || "h-11 w-12"}
    >
      <path
        d="M27 0L36.1778 13.5L54 16.8065L41.85 28.4565L43.6869 44L27 37.7L10.3131 44L12.15 28.4565L0 16.8065L17.8222 13.5L27 0Z"
        fill="#626262"
      />
      <path
        d="M10.3131 44L27 37.7V0L17.8222 13.5L0 16.8065L12.15 28.4564L10.3131 44Z"
        fill="#626262"
      />
    </svg>
  );

  return (
    <MT_Rating
      value={Math.round(value)}
      ratedIcon={ratedIcon}
      unratedIcon={unratedIcon}
      className={`flex h-full ${gap || "gap-3"}`}
      readonly={readonly}
      placeholder=""
    />
  );
};

export default Rating;
