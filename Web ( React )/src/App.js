// import axios from "axios";
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Login from './Account/Login'
import Home from './Home/Home'
import Updata_Hotel from './Home/Updata_Hotel'
function App() {
  // let s =useContext(User_Name)
  // s.setauth='Dog'
  // console.log(s.setauth)

  return (
    <div>
      {/* <Tset/> */}
      {
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<Login />} />
            <Route path="/Home" element={<Home />} />
            {/* <Route path="Home/upadata/" element={<Updata_Hotel />} /> */}
            <Route path="*" element={<Login />} />
          </Routes>
        </BrowserRouter>
      }
    </div>
  )
}

export default App
