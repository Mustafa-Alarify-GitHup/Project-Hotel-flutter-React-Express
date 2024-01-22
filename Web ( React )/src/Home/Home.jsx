import "../Style/Home.css";
import G_Users from "./G_Users";
import G_Hotel from "./G_Hotel";
import Add_New_Hotel from "./Add_New_Hotel";
import { useState } from "react";
const Home = () => {
  const [index_page, setindex_page] = useState(0)
 function Authontion(){
  if( localStorage.getItem("name") === null){
    window.location.pathname='/';
}
 }
 function Btn(index){
  setindex_page(index);
  const btn = document.getElementsByClassName('btnAdmin');
  for (let index = 0; index < btn.length; index++) {
    btn[index].style.backgroundColor='transparent';
    
  }
  btn[index].style.backgroundColor='#113b65';
 }
//  Authontion();
  return (
    <div id="AdminContiner">

      {/* Drower */}
      <div id="Drower">
          <h1 >Servies</h1>
          <h5 className="titelServies">Propties Hotel</h5>
          <hr className="line"/>

      <button className="btnAdmin" onClick={()=>Btn(0)}>All Data Hotel </button>
      <button className="btnAdmin" onClick={()=>Btn(1)}>Add New Hotel </button>
       <h5 className="titelServies">Propties Users</h5>
          <hr className="line"/>

      <button className="btnAdmin" onClick={()=>Btn(2)}>All Data Users </button>
      </div>
        {/*// Drower //*/}
 

      <div id="admin_page">
        <center>
          <div id="apper">
            <h2>Admin : <span>Mustafa mohammed</span></h2>
          <div>
              <button id="btnApper"> <img src={require('../img/not.png')} alt="" style={{marginRight:'15px'}} /></button>
              <button id="btnApper"> <img src={require('../img/out.png')} alt=""/></button>
          </div>
          </div>
          <div id="adminServies">
            {
            index_page===0?<G_Hotel/>
            :index_page===1?<Add_New_Hotel/>
            :<G_Users/>
            }
          </div>
        </center>
      </div>

     
    </div>
  );
};

export default Home;
