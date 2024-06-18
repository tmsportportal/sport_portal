import React from "react";
import { useEffect } from "react";
import { useLocation } from "react-router-dom";

const ScrollToTop = () => {
  const { pathname, state } = useLocation();

  useEffect(() => {
    pathname === "/"
      ? window.scrollTo({ top: 0, left: 0, behavior: "smooth" })
      : window.scrollTo({ top: 290, left: 0, behavior: "smooth" });
  }, [pathname, state]);

  return <></>;
};

export default ScrollToTop;
