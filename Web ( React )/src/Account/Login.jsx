import React, { useEffect, useState } from "react";

import axios from "axios";

const Login = () => {
  const [isLogin, setisLogin] = useState(true);
  const [email, setemail] = useState('')
  const [user_name, setuser_name] = useState('')
  const [password, setpassword] = useState('')
  const [error, seterror] = useState(false)

  function Togg(){
    setisLogin(!isLogin);
    seterror(false)
    setemail('')
    setuser_name('')
    setpassword('')
    let login =document.getElementById("mainLogin");
    let signup =document.getElementById("mainSi");
    if(!isLogin){
      login.style.transform=`scale(0)`;
      setTimeout(() => {
        signup.style.transform=`scale(1)`;
      }, 400);
    }else{
      signup.style.transform=`scale(0)`;
      setTimeout(() => {
        login.style.transform=`scale(1)`;
      }, 400);
    }
  }
 async function Login(event){
  event.preventDefault()
    try{
    const respones= await axios.post("http://localhost:5000/Login",{
      "email":email,
      "password":password,
    });
    console.log(respones.data.status);
    if(respones.data.status === 'true'){
      localStorage.setItem('name',user_name);
      window.location.pathname="/home"
    }else{
        seterror(true)
    }
    
   
    }catch(E){
      console.log(E); 
    }
  }
  async function SignUP(event){
    event.preventDefault()
    try{
      if(user_name!=="" && email!=="" && password.length>=7){
        let respones =await axios.post('http://localhost:5000/add_user',{
        "name":user_name,
        "email":email,
        "password":password
      })
     
      console.log(respones)
      
      console.log(respones.data)
      if(respones.data.Status === "true"){
        localStorage.setItem('name',user_name);
          window.location.pathname='/home'
      }
      }else{
        seterror(true);

      }
      
    }
    catch(E){console.log(E)}
  }
useEffect(() => {
  return () => {
    Togg()
  };
}, [])
  return (
    <>
      <div id="mainLogin">
        <img id="imgLoginUp" src={require("../img/up.png")} alt="" />
        <img id="imgLoginDown" src={require("../img/under.png")} alt="" />

        <div id="centerLogin">
          <div id="imgLoginCenter">
            <img src={require("../img/Logins.png")} alt="" />
          </div>
          <div id="formLogin">
            <center>
              <h1>Login</h1>
              <p>Wellcome back make sure to register your email and password</p>
              <form  method="post" onSubmit={Login}>
                <input
                  className="inputLogin"
                  type="text"
                  placeholder="E-mail"
                  value={email}
                  onChange={function(val){setemail(val.target.value)}}
                  
                />
                <input
                  className="inputLogin"
                  type="text"
                  placeholder="Password"
                  
                  value={password}
                  onChange={function(val){setpassword(val.target.value)}}
                />
                {error?<p>The Accouny is Not Difend</p>:null}
                <button id="btn_login" type="submit">
                  Login
                </button>
           
              </form>
              <button id="btn_sign_login" onClick={Togg} >
                  I don`t Have Account <span id="click_s">Click Here</span>
                </button>
            </center>
          </div>
        </div>
      </div>
      {/* Sign up Here */}
      <div>
        <div id="mainSi">
          <img id="imgSiUp" src={require("../img/up2.png")} alt="" />
          <img id="imgSiDown" src={require("../img/under2.png")} alt="" />

          <div id="centerSi">
            <div id="imgSiCenter">
              <img src={require("../img/sin.png")} alt="" />
            </div>
            <div id="formRi">
              <center>
                <h1>Sign Up</h1>
                <p>Plases write name and email and password</p>
                <form onSubmit={SignUP} method="post">
                  <input
                    className="inputSi"
                    type="text"
                    placeholder="User Name"
                    name="name"
                    
                    value={user_name}
                    onChange={function(val){setuser_name(val.target.value)}}
                  />
                  {error&&user_name===""?<p>Error Name</p>:null}
                  <input 
                  className="inputSi"
                   type="text"
                   name="email"
                    placeholder="E-mail"
                    value={email}
                    onChange={function(val){setemail(val.target.value)}}
                    />
                    {error&&email===""?<p>Error pass</p>:null}

                  <input
                    className="inputSi"
                    type="text"
                    placeholder="Password"
                    name="Password"
                    value={password}
                    onChange={function(val){setpassword(val.target.value);console.log(password)}}
                  />
                 {error&&password.length<7?<p>Error</p>:null}

                  <button id="btn_Si" type="submit">
                    Login
                  </button>
                  
                </form>
                <button id="btn_sign" onClick={ Togg}>
                    I Have Account <span id="click_l">Click Here</span>
                  </button>
              </center>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Login;
