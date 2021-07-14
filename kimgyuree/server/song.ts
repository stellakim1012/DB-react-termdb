import express, { Request, Response } from "express"
import mysql from "mysql"
import cors from "cors"

const app = express()

app.use(cors())

const dbc = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'mysql1234',
	database: 'songdb'
})

dbc.connect()

app.listen('3001', () => {
	console.log('Server Started')
})

app.get('/song', (req: Request, res: Response) => {
	const query: string = 'select * from album left join song on (album.id = album_id) left join singer on (singer_id = singer.id) left join image on (song.album_id = image.album_id)'
	dbc.query(query, (err, rows) => {
		if (err) return console.log(err)
		res.send(rows)
	})
})