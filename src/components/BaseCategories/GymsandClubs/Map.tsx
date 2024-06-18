import React from "react";
import "./css/Map.css";
import { TileLayer, MapContainer, Marker, Popup } from "react-leaflet";
import { Icon, Point } from "leaflet";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { IGymsAndClubs } from "../../../redux/interfaces/gymsclubs";
import { useLocation, useNavigate } from "react-router-dom";

// const markerIcon = new Icon({ iconUrl: "/icons/gymsclubs/location.png" });
const markerIcon = new Icon({
  iconUrl: "/icons/gymsclubs/location.png",
  iconSize: [26, 26],
});

const Map = () => {
  // Hooks
  const navigate = useNavigate();
  const { pathname } = useLocation();
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const gymsclubs: IGymsAndClubs[] = useSelector(
    (state: RootState) => state.gymsclubs.gymsclubs
  );

  // Function
  const linkToGACDetail = (gymsclubsId: string) => {
    navigate(pathname + "/detail", { state: { gymsclubsId } });
  };

  return (
    <MapContainer
      center={[37.9312, 58.3874]}
      zoom={12}
      scrollWheelZoom={false}
      attributionControl={false}
    >
      <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
      {gymsclubs.map((gc, index) => {
        return (
          <Marker
            position={[gc.latitude, gc.longitude]}
            icon={markerIcon}
            key={index}
            alt=""
            riseOnHover
          >
            <Popup>
              <button type="button" onClick={() => linkToGACDetail(gc.id)}>
                {prefLang === "Tm" ? gc.nameTm : gc.nameRu}
              </button>
            </Popup>
          </Marker>
        );
      })}
    </MapContainer>
  );
};

export default Map;
