import axios from "axios";
import React, { useEffect, useState } from "react";

const G_Users = () => {
  const [data, setdata] = useState([]);
  const [refrish, setrefrish] = useState(true)

 async function Delete(parma){
    try{
     await axios.delete(`http://localhost:5000/delete/${parma}`);
     setrefrish(!refrish)
        }catch(E){
      console.log(E);
    }
  }

  
  useEffect(() => {
    fetch("http://localhost:5000/GetAllUsers")
      .then((response) => response.json())
      .then((res) => setdata(res.data));
    // Colors
    let tr =document.getElementsByClassName("data_users");
    for (let index = 0; index < tr.length; index++) {
      if(index%2 === 0){
         tr[index].style.backgroundColor='#0000003b';
      }} 
  }, [refrish]);

  let show_Data = data.map((e,index) => (
    <tr className="data_users" key={index}>
      <td>{e.name}</td>
      <td>{e.email}</td>
      <td>{e.password}</td>
      <td>Updata</td>
      <td><button onClick={()=>Delete(e._id)} style={{backgroundColor:"transparent",border:'none'}}>
        <img src={require('../img/delete.png')} alt="" />
        </button></td>
    </tr>
  ));
  return (
    <div>
      <table id="table_user">
        <thead>
          <tr id="t">
            <td>Name</td>
            <td>Email</td>
            <td>Password</td>
            <td>Updata</td>
            <td>Delete</td>
          </tr>
        </thead> 
        {data.length>0?<tbody>{show_Data}</tbody>:null}
      </table>
    </div>
  );
};

export default G_Users;
