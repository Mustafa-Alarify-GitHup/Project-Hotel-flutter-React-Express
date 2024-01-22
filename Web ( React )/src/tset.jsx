import React, { useState } from 'react'

const Tset = () => {
  const [data, setdata] = useState('')
  return (
    <div>
      <h1>{data}</h1>
      <button onClick={()=>{setdata('Ahmed')}}>ssssssssssss</button>
      <button onClick={()=>{setdata("jjjjjjjjjjjj")}}>aaaaaaaaaaaaa</button>
    </div>
  )
}
export default Tset
