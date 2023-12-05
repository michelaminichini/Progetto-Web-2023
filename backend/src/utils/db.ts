import mysql, { Connection } from 'mysql2'

export const connection: Connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'cinema'
})

/* modo alternativo

import mysql, { Connection } from "mysql2/promise"

let conn: Connection | null = null

export const getConnection = async () => {
  if (!conn) {
    conn = await mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "",
      database: "vuepost",
    })
  }
  return conn
}
*/