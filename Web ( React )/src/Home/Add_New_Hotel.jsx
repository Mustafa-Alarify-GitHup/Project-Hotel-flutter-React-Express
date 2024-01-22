import axios from "axios";
import React, { useState } from "react";

const Add_New_Hotel = () => {
  const [name, setname] = useState("");
  const [img, setimg] = useState("");
  const [price, setprice] = useState("");
  const [start, setstart] = useState("");
  const [dec, setdec] = useState("");

  async function Add(event) {
    event.preventDefault();

    try {
      let respones = await axios.post("http://localhost:5000/add_Hotel", {
        name: name,
        img: img,
        img1: "1.png",
        img2: "3.png",
        img3: "5.png",
        img4: "2.png",
        price: price,
        start: start,
        counter_start: 100,
        dec: dec,
      });
      console.log(respones);
      window.location.pathname='/home'
    } catch (E) {
      console.log(E);
    }
  }
  return (
    <div id="divAdd_hotel">
      <form method="post" onSubmit={Add}>
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
          Create
        </button>
      </form>
    </div>
  );
};

export default Add_New_Hotel;
