import axios from "axios";
import React, { useEffect, useState } from "react";

const G_Hotel = () => {
  const [data, setdata] = useState([]);
  const [refrish, setrefrish] = useState(true);
  //updata
  const [name, setname] = useState("");
  const [img, setimg] = useState("");
  const [price, setprice] = useState("");
  const [start, setstart] = useState("");
  const [dec, setdec] = useState("");
  const [ID, setId] = useState("");

  function ShowUpdata(value) {
    // event.preventDefault();
    const div_Updata = document.getElementById("DivUpdata");
    div_Updata.style.transform = `scale(${value})`;
  }
  async function Updata(event) {
    event.preventDefault();

    let res = await axios.put(`http://localhost:5000/put/${ID}`, {
      name:name,
      img:img,
      img1:img ,
      img2: "1.png",
      img3: "1.png",
      img4: "1.png",
      price:price ,
      start:start ,
      counter_start: 100,
      dec: dec,
    });
    setrefrish(!refrish);
    console.log(res);
    ShowUpdata(0) 
  }
  async function Delete(parma) {
    try {
      await axios.delete(`http://localhost:5000/delete_Hotel/${parma}`);
      setrefrish(!refrish);
    } catch (E) {
      console.log(E);
    }
  }
  useEffect(() => {
    fetch("http://localhost:5000/get_data_all_hotel")
      .then((response) => response.json())
      .then((res) => setdata(res.data));
    // Colors
  }, [refrish]);
  setTimeout(() => {
    let tr = document.getElementsByClassName("data_users");
    for (let index = 0; index < tr.length; index++) {
      if (index % 2 === 0) {
        tr[index].style.backgroundColor = "#0000003b";
      }
    }
  }, 2000);

  let show_Data = data.map((e, index) => (
    <tr className="data_users" key={index}>
      <td>{e.name}</td>
      <td>{e.price}</td>
      <td style={{ width: "30%", fontSize: "14px" }}>{e.dec}</td>
      <td>
        <button
          onClick={() => {
            ShowUpdata(1);
            setname(e.name);
            setimg(e.img);
            setprice(e.price);
            setstart(e.start);
            setdec(e.dec);
            setId(e._id);
          }}
          style={{
            transform: "scale(1.15)",
            backgroundColor: "transparent",
            border: "none",
          }}
        >
          <img src={require("../img/edite.png")} alt="" />
        </button>
      </td>
      <td>
        <button
          onClick={() => Delete(e._id)}
          style={{ backgroundColor: "transparent", border: "none" }}
        >
          <img src={require("../img/delete.png")} alt="" />
        </button>
      </td>
    </tr>
  ));
  return (
    <div>
      {/* Updata */}
      <div id="DivUpdata">
        <center>
          <br />
          <br />
          <h1>Updata</h1>
          <button id="btn_close" onClick={() => ShowUpdata(0)}>
            Close
          </button>
        </center>
        <form method="post" onSubmit={Updata}>
          <input
            type="text"
            name="name"
            className="input_Add_hotel"
            placeholder="name"
            value={name}
            onChange={(val) => setname(val.target.value)}
          />
          <input
            className="input_Add_hotel"
            type="text"
            placeholder="Image"
            name="name"
            value={img}
            onChange={function (val) {
              setimg(val.target.value);
            }}
          />
          <input
            type="number"
            name="price"
            className="input_Add_hotel"
            placeholder="price"
            value={price}
            onChange={(val) => setprice(val.target.value)}
          />
          <input
            type="number"
            name="start"
            className="input_Add_hotel"
            placeholder="start"
            value={start}
            onChange={(val) => setstart(val.target.value)}
          />
          <input
            type="text"
            name="dec"
            className="input_Add_hotel"
            placeholder="dec"
            value={dec}
            onChange={(val) => setdec(val.target.value)}
          />
          <button type="submit" id="btn_add_hotel">
            Updata
          </button>
        </form>
      </div>

      {/* Get All Data */}
      <table id="table_user">
        <thead>
          <tr id="t">
            <td>Name</td>
            <td>price</td>
            <td style={{ width: "40%" }}>description</td>
            <td style={{ width: "10%" }}></td>
            <td style={{ width: "10%" }}></td>
          </tr>
        </thead>
        {data.length > 0 ? <tbody>{show_Data}</tbody> : null}
      </table>
    </div>
  );
};

export default G_Hotel;
