import React, { useState, useEffect } from 'react'
import axios from 'axios'


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
    <div>
      <h1>
        Procedures
      </h1>

      <div>
        <input
          value={input}
          onChange={({ target: { value } }) => setInput(value)}
        />
      </div>

      {procedures &&
        <div>
          {procedures.map(procedure =>
            <div key={procedure.id}>
              {procedure.title}
            </div>
          )}
        </div>
      }
    </div>
  )
}
