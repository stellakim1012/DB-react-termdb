import { useState, useEffect } from 'react'
import './App.css'
import axios from 'axios'

export default function App() {
  return (
    <div>
        <h1>
           즐겨 듣는 노래_20190101 김규리 
        </h1>
        <SongTable/>
    </div>
  )
}

const SongTable = () => {
	const [songs, setSongs] = useState<any[]>([])
	
	const fetchSong = async() => {
		try {
			const res = await axios.get('https://term-20190101.run.goorm.io/song')
	        console.log(res)
			setSongs(res.data)
		} catch (err) {
			console.log(err)
		}
	}
	
	useEffect(() => {
		fetchSong()
	}, [])
    
    return (
        <table>
            <thead>
                <tr key='0'>
                    <th>앨범표지</th>
					<th>아티스트</th>
					<th>종류</th>
					<th>발매일</th>
					<th>타이틀곡</th>
					<th>수록곡</th>
				<th>소속사</th>
                </tr>
            </thead>
            <tbody>
                {songs.map((song, index) =>
                    <tr key={index}>
                        <td><img src={`https://term-20190101-zhiqu.run.goorm.io/images/${song.filename}`} className='boxart'/></td>
                        <td>{song.name}</td>
						<td>{song.description}</td>
						<td>{song.sale}</td>
						<td>{song.title}</td>
						<td>{song.sub1}</td>
						<td>{song.agency}</td>
                    </tr>
                )}
            </tbody>
        </table>
    )
}