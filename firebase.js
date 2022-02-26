'use strict'
//const admin = require('firebase-admin')
const express = require('express')
const cors = require('cors')
const app = express()
const {
  setTimeout,
} = require('timers/promises');


//const { getDatabase,ref,onValue,child,get } = require('firebase/database')
var firebase=require('firebase')
app.use(express.json())
app.use(cors())
//var serviceAccount=require('C:/Users/Dell/Desktop/baby/admin.json');
// const firebaseConfig = {
//   apiKey: 'AIzaSyDjDXBfWk6YqnoKdgLxKdXgw0MnsxTOG6Y',
//   authDomain:'baby-monitor-e77c6.firebaseapp.com',
//   projectId: 'baby-monitor-e77c6',
//   storageBucket:'baby-monitor-e77c6.appspot.com',
//   messagingSenderId: '418822486847',
//   appId: '1:418822486847:android:8e4c25f8985cd30458f18a',
//   databaseURL:'https://baby-monitor-e77c6-default-rtdb.firebaseio.com/'
// }

 firebase.initializeApp({
  //credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://baby-monitor-e77c6-default-rtdb.firebaseio.com/",
  //authDomain: "baby-monitor-e77c6.firebaseapp.com",
});

var data;
var info=[]
 function GetAllDataOnce()
{
  
    const db=firebase.database().ref('mlx90614/1-set/object');
     db.once('value',(snapshot) => {
        data = snapshot.val();
        console.log(data);
        
      });
      setTimeout(100, 'result').then((res) => { // Prints 'result'
      });
      return data;
     // console.log("hello");
}


app.get('/',(req,res)=>{
 var c=GetAllDataOnce();
  res.json({"temperature":c});
})
 
app.listen(4000, () => console.log('up and running 4000'))

