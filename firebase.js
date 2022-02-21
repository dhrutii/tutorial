const firebase = require('firebase')
const firebaseConfig = {
  apiKey: 'AIzaSyBJPmp9p9OuBzVZwE_dHFA0ql3W8vge9LE',
  authDomain: 'tutorial-e9e44.firebaseapp.com',
  projectId: 'tutorial-e9e44',
  storageBucket: 'tutorial-e9e44.appspot.com',
  messagingSenderId: '76830312309',
  appId: '1:76830312309:web:b724427a8425abc705f53c',
  measurementId: 'G-734D5VG5VM',
}

const db = firebase.initializeApp(firebaseConfig)
module.exports = db
