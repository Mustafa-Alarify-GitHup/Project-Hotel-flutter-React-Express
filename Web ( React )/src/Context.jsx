import { createContext, useState } from "react";

export const User_Name = createContext({});

export function Provider({ children }) {
    const [auth, setauth] = useState({});
  return (
    <User_Name.Provider value={{auth,setauth}}>
        {children}
    </User_Name.Provider>
  );
}
