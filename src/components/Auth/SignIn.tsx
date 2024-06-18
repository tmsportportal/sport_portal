import React, { FC, FormEvent, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { authDialogOpen } from "../../redux/actions/main";
import { RootState } from "../../redux/store";
import { POST_LOGIN } from "../../redux/types";

interface Props {
  linkToGoogleAuth: () => void;
}

const SignIn: FC<Props> = ({ linkToGoogleAuth }) => {
  // Hooks
  const dispatch = useDispatch();
  const [email, setEmail] = useState("");
  const [plainPassword, setPlainPassword] = useState("");

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const auth_message = useSelector(
    (state: RootState) => state.main.auth_message
  );

  // Function
  const postSignIn = (e: FormEvent) => {
    e.preventDefault();
    dispatch({ type: POST_LOGIN, payload: { email, plainPassword } });
    setPlainPassword("");
  };

  return (
    <>
      <form
        className="relative flex flex-col justify-center items-center bg-white p-8 gap-6 max-w-[472px] w-full"
        onSubmit={(e: FormEvent<HTMLFormElement>) => postSignIn(e)}
      >
        <img
          src={process.env.REACT_APP_ADDRESS + "icons/toolbox/x50.png"}
          alt=""
          className="absolute top-4 right-4 h-6 w-6 cursor-pointer"
          onClick={() => dispatch(authDialogOpen(false))}
        />
        <img
          src="/icons/toolbox/logo.png"
          alt=""
          className="w-[165px] h-[90px] object-contain"
        />
        <div className="flex flex-col items-center">
          <p className="text-3xl text-[#181E25] font-semibold">
            {prefLang === "Tm" ? "Bize agza bol!" : "Присоединяйтесь!"}
          </p>
          <p className="text-[#788BA5] text-sm max-w-xs text-center">
            {prefLang === "Tm"
              ? "Baglan, habarly bol, teswirleriňi galdyr"
              : "Оставайтесь на связи, оставайтесь в курсе, оставляйте комментарии"}
          </p>
        </div>
        <button
          className="flex justify-center items-center border text-[#181E25] w-full h-10"
          onClick={() => linkToGoogleAuth()}
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="21"
            height="21"
            viewBox="0 0 21 21"
            fill="none"
          >
            <path
              d="M19.1911 10.5168C19.1911 9.79801 19.1317 9.27301 19.003 8.72864H10.6199V11.9755H15.5405C15.4411 12.7824 14.9055 13.998 13.7155 14.8143L13.6986 14.923L16.3486 16.9355L16.5324 16.9536C18.2192 15.4268 19.1911 13.1811 19.1911 10.5174V10.5168Z"
              fill="#4285F4"
            />
            <path
              d="M10.6193 19.0729C13.0299 19.0729 15.0537 18.2954 16.5318 16.9536L13.7149 14.8142C12.9606 15.3298 11.9487 15.6892 10.6193 15.6892C9.49925 15.6893 8.40726 15.3388 7.49646 14.6869C6.58566 14.035 5.90172 13.1144 5.54055 12.0542L5.43618 12.0629L2.67993 14.1529L2.64368 14.2511C4.1118 17.1092 7.12805 19.0729 10.6193 19.0729Z"
              fill="#34A853"
            />
            <path
              d="M5.54054 12.0537C5.34557 11.4972 5.24501 10.912 5.24304 10.3224C5.24304 9.71992 5.35241 9.13679 5.53054 8.59242L5.52554 8.47679L2.73491 6.35242L2.64366 6.39492C2.01917 7.61024 1.69268 8.95666 1.69116 10.323C1.69116 11.733 2.03866 13.0649 2.64366 14.2505L5.54054 12.0543V12.0537Z"
              fill="#FBBC05"
            />
            <path
              d="M10.6193 4.95612C12.2962 4.95612 13.4268 5.66612 14.0718 6.25925L16.5918 3.848C15.0443 2.438 13.0306 1.573 10.6193 1.573C7.12807 1.573 4.11182 3.53675 2.64307 6.39487L5.53057 8.59237C6.25432 6.483 8.25869 4.95612 10.6193 4.95612Z"
              fill="#EB4335"
            />
          </svg>
          {prefLang === "Tm"
            ? "Google bilen baglan"
            : "Зарегистрируйтесь через Google"}
        </button>
        <p className="text-sm text-red-600 text-start w-full">{auth_message}</p>
        <div className="flex flex-col items-center w-full gap-1">
          <p className="text-sm text-[#181E25] w-full">
            {prefLang === "Tm"
              ? "Elektron poçta"
              : "Email (*или номер телефона)"}
          </p>
          <input
            type="email"
            name="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.currentTarget.value)}
            className="border w-full h-10 outline-none px-3"
            required
          />
        </div>
        <div className="flex flex-col justify-between items-center w-full gap-1">
          <div className="w-full flex justify-between items-center">
            <p className="text-sm text-[#181E25]">
              {prefLang === "Tm" ? "Açar sözi" : "Пароль"}
            </p>
            <p className="text-sm text-[#117DF9] cursor-pointer">
              {prefLang === "Tm" ? "Ýatdan çykardym?" : "Забыли пароль?"}
            </p>
          </div>
          <input
            type="password"
            name="password"
            id="password"
            value={plainPassword}
            onChange={(e) => setPlainPassword(e.currentTarget.value)}
            className="border w-full h-10 outline-none px-3"
            required
          />
        </div>
        <button type="submit" className="bg-[#4938C3] text-white w-full h-10">
          {prefLang === "Tm" ? "Içeri gir" : "Войти"}
        </button>
      </form>
      <p className="text-white flex gap-1">
        {prefLang === "Tm" ? "Ulanyjyň öň bolamasa?" : "У Вас еще нет?"}
        <p className="text-[#117DF9] cursor-pointer">
          {prefLang === "Tm" ? "Agza bol" : "Зарегистрироваться"}
        </p>
      </p>
    </>
  );
};

export default SignIn;
