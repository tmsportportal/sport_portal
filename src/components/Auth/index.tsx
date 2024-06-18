import { Dialog } from "@material-tailwind/react";
import React, { FC } from "react";
import { useNavigate } from "react-router-dom";
import SignIn from "./SignIn";
import { useDispatch, useSelector } from "react-redux";
import { authDialogOpen } from "../../redux/actions/main";
import { urlBack } from "../../redux/apiCalls";
import { RootState } from "../../redux/store";

const Authentication: FC = () => {
  // Hooks
  const navigate = useNavigate();
  const dispatch = useDispatch();

  // useSelector
  const open = useSelector((state: RootState) => state.main.auth_dialog_open);
  // Function
  const linkToGoogleAuth = () => {
    navigate(urlBack + "auth");
    dispatch(authDialogOpen(false));
  };

  return (
    <Dialog
      size="xxl"
      open={open}
      handler={() => dispatch(authDialogOpen(!open))}
      className="bg-black/70 shadow-none rounded-none h-screen backdrop-blur-sm"
      placeholder=""
    >
      <div className="flex justify-center items-center flex-col h-full w-full min-w-[300px] font-inter gap-6">
        <SignIn linkToGoogleAuth={linkToGoogleAuth} />
      </div>
    </Dialog>
  );
};

export default Authentication;
