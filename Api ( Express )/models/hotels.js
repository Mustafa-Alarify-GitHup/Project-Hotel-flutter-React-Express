const mongoose = require('mongoose');

const schema_hotel = new mongoose.Schema({
    name: {type: String,require: true,},
    img: {type: String,require: true,},
    img1: {type: String,require: true,},
    img2: {type: String,require: true,},
    img3: {type: String,require: true,},
    img4: {type: String,require: true,},
    price: {type: Number,require: true,},
    start: {type: Number,require: true,},
    counter_start: {type: Number,require: true,},
    dec: {type: String,require: true,},
  },{timestamps:true}
  
  );
  const hotel = mongoose.model("hotel", schema_hotel);

  module.exports = { hotel }