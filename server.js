'use strict'
const express = require('express')
const cors = require('cors')
const app = express()
const firebase = require('./firebase')
require('firebase/firestore')
app.use(express.json())
app.use(cors())

app.post('/create', async (req, res) => {
  const data = req.body
  console.log('Data of users', data)
  await firebase.firestore().collection('users').add(data)
  res.send({ msg: 'user added' })
})
var info=[]
function GetAllDataOnce()
{
    firebase.firestore().collection('users').get().then((querySnapshot)=>{
      
        querySnapshot.forEach(doc => {
          info.push(doc.data());
        });
        //console.log(querySnapshot);
        console.log(info);
    })
}

GetAllDataOnce();
app.get('/',(req,res)=>{
  res.send(info);
})
app.listen(4000, () => console.log('up and running 4000'))
