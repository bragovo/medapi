import React from 'react'
import ReactDOM from 'react-dom'

import './app.css'

import Procedures from '../components/Procedures'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Procedures />,
    document.getElementById('root')
  )
})
