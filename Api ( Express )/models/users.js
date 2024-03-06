const mongoose = require('mongoose');

const schema_user = new mongoose.Schema({
    name: {
      type: String,
      require: true,
    },
    email: {
      type: String,
      require: true,
    },
    password: {
      type: String,
      require: true,
    },
    isAdmin:{
      type:Boolean,
      default:false
    }
  },{timestamps:true});
  
  const Users = mongoose.model("user", schema_user);

  module.exports =  {Users} 