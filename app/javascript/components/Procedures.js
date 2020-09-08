import React, { useState, useEffect } from 'react'
import axios from 'axios'

import styles from './Procedures.module.css'

export default function Procedures () {
  const [procedures, setProcedures] = useState()
  const [input, setInput] = useState('')

  const _fetch = async () => {
    const { data } = await axios.get('/api/v1/procedures.json', { params: { q: input }})

    setProcedures(data.procedures)
  }

  useEffect(() => {
    _fetch()
  }, [input])

  return (
    <div className={styles.root}>
      <h1 className={styles.title}>
        Procedures
      </h1>

      <div className={styles.filter}>
        <input
          value={input}
          onChange={({ target: { value } }) => setInput(value)}
        />
      </div>

      {procedures &&
        <div className={styles.procedures}>
          {procedures.map(procedure =>
            <div key={procedure.id} className={styles.procedure}>
              {procedure.title}
            </div>
          )}
        </div>
      }
    </div>
  )
}
