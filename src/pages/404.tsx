import React, { useEffect } from "react";
import { useLocation, useNavigate } from "react-router-dom";

const NF404 = () => {
  const navigate = useNavigate();
  const { pathname } = useLocation();
  console.log(pathname);

  useEffect(() => {
    navigate("/");
  }, []);

  return <></>;
};

export default NF404;
